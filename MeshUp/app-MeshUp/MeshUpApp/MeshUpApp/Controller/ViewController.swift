//
//  ViewController.swift
//  MeshUpApp
//
//  Created by Tom Marler on 1/23/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NewsAPIService.instance.getRequest()
        items.append(Task(value: ["text": "My First Task"]))
    }
    
    func setupUI() {
        title = "My Tasks"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.textLabel?.alpha = item.completed ? 0.5 : 1
        return cell
    }

}

