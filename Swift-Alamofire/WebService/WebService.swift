//
//  WebService.swift
//  Swift-Alamofire
//
//  Created by Ünal Öztürk on 18.05.2018.
//  Copyright © 2018 Ünal Öztürk. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String:Any]
private let baseURL: String = "http://api.letsbuildthatapp.com/"



class WebService {
    
    static let shared = WebService()
    private init() {}
    
    var courses = [Course]()
    
    func getCourses(success successBlock: @escaping ( [Course] ) -> Void ){
        
        Alamofire.request("\(baseURL)jsondecodable/courses_snake_case").validate().responseData { (response) in
            switch response.result {
                
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    //Swift 4.1 Snake case
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.courses = try decoder.decode( [Course].self, from: value )
                    print("Courses:",self.courses)
                    successBlock(self.courses)
                    
                } catch let jsonError {
                    print("Failed to decode:",jsonError)
                }
                
            case .failure(let error):
                    print("Request error:", error)
            }
        }
    }
}
