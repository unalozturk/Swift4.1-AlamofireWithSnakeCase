//
//  ViewController.swift
//  Swift-Alamofire
//
//  Created by Ünal Öztürk on 18.05.2018.
//  Copyright © 2018 Ünal Öztürk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var courses = [Course]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func getClicked(_ sender: Any) {
        WebService.shared.getCourses { _courses in
            self.courses = _courses
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
    @IBAction func deleteClicked(_ sender: Any) {
        self.courses.removeAll()
        self.tableView.reloadData()
    }
    
   

}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let course = courses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = String(course.numberOfLessons)
        return cell
    }
}

