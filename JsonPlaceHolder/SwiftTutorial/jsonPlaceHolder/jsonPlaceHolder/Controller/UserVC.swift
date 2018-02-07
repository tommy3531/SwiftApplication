//
//  UserVC.swift
//  jsonPlaceHolder
//
//  Created by Tom Marler on 1/14/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit
import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class UserVC: UIViewController {

    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Calling getRequest")
        users = getdata()
        userIDLabel.text = "\(users.count)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRequestTwo(for userId: Int, completion: ([User]) -> Void) {
        
        // Break This down let urlString = "https://jsonplaceholder.typicode.com/users"
        
        // Build the URL String
        var urlComponents = URLComponents()
        
        // https
        urlComponents.scheme = "https"
        
        // Host
        urlComponents.host = "jsonplaceholder.typicode.com"
        
        // Host Path
        urlComponents.path = "/posts"
        
        let userIdItem = URLQueryItem(name: "userId", value: "\(userId)")
        urlComponents.queryItems = [userIdItem]
        
        // Guard against URL being nil or empty
        guard let url = urlComponents.url else {fatalError("Could not create URL for the componets provided")}
        
        // Turn string into URL request
        var request = URLRequest(url: url)
        
        // Make the get request
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                
                let decoder = JSONDecoder()
                
                do {
                    _ = try decoder.decode([User].self, from: data!)
                    //completion?(.success(users))
                } catch {
                    //completion?(.failure(error))
                }
            }
        }
        task.resume()
        
    }
    
    func getdata() -> [User] {

        var users = [User]()
        getRequestTwo(for: 1) { (result) in
            users = result

        }
        
        return users
    }
}
    
//    func getRequest() {
//
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if let response = response {
//                print("This is the response: \(response)")
//            }
//
//            guard let data = data  else { return }
//            var userObj : User
//
//            //let users = try JSONDecoder().decode([[User]].self, from: data)
//            //print(users)
//            //Decode retrieved data with JSONDecoder and assign type of UserObject
//            let jsonArray = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
//            for jsonDict in jsonArray! {
//                let userId = jsonDict["id"] as? Int
//                let name = jsonDict["name"] as? String
//                let username = jsonDict["username"] as? String
//                let email = jsonDict["email"] as? String
//                userObj = User(id: userId!, name: name!, username: username!, email: email!)
//                self.users.append(userObj)
//
//            }
//            DispatchQueue.main.async {
//                for dict in self.users {
//                    self.userIDLabel.text = String(describing: dict.id)
//                    self.nameLabel.text = dict.name
//                    self.userNameLabel.text = dict.username
//                    self.userEmailLabel.text = dict.email
//
//                }
//            }
//        }
//        task.resume()
//    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
