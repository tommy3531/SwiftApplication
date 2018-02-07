//
//  FirstViewController.swift
//  breakpoint
//
//  Created by Tom Marler on 1/17/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    
    private(set) var dataService: DataService!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BaseViewController {
            destination.dataService = dataService
        }
    }
}

protocol DataServiceContainer {
    var dataService: DataService {get}
}

extension DataServiceContainer {
    var dataService: DataService {
        return DataService.instance
    }
}

class FeedVC: UIViewController, DataServiceContainer {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        

        //tableView.estimatedRowHeight = 100
        //tableView.rowHeight = 


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedTVC else { return UITableViewCell() }
        //let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
                
        DataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            //print("This is userName")
            //print(returnedUsername)
            DataService.instance.getUserPic(forUID: message.senderId, handler: { (profilePic) in
                
                //print("This is the profilepic")
                //print(profilePic)
                //let imageStr = "dark9"

                cell.configureCell(profileImage: UIImage(named: profilePic)!, email: returnedUsername, content: message.content)
            })
            
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
//        footerView.backgroundColor = UIColor.white
//        return footerView
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 40.0
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell with indexPath: \(indexPath)")
//    }
    
    // This one function takes care of the message delete and cell delete
    // TODO: Need to delete from the DB
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let message = messageArray[indexPath.row].content
            let senderId = messageArray[indexPath.row].senderId
            
            // Remove the item from the message Array
//            messageArray.remove(at: indexPath.row)
//
//            // Delete the table view row
//            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Need to delete from the Database
            DataService.instance.deleteMessage(senderID: senderId, userMessage: message, handler: { (statusCode) in
                
                //return(statusCode)
                
                // Remove the item from the message Array
                self.messageArray.remove(at: indexPath.row)

                // Delete the table view row
                tableView.deleteRows(at: [indexPath], with: .fade)

                
            })
        } else {
            
        }
    }
}
