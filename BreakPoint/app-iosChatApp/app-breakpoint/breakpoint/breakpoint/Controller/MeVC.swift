//
//  MeVC.swift
//  breakpoint
//
//  Created by Tom Marler on 1/17/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageOnStartUp()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
        if UserDataService.instance.profilePic != "" {
            DataService.instance.getPicOfCurrentUser(email: self.emailLbl.text!, handler: { (value) in
                self.profileImage.image = UIImage(named: UserDataService.instance.profilePic)
                print("viewwillAppear")
                print(value)
            })
            loadImage()
        }
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        logout()
        
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
    func logout() {
        UserDataService.instance.setUserData(username: "", email: "", profilePic: "")
        UserDataService.instance.setProfilePic(profilepic: "")
        
    }
    
    func loadImageOnStartUp() {
        print("This is from MeVC")
        print("This is the email form MeVC: \(emailLbl.text)")
        print("We need to get the auth user:")
        let userRef = Auth.auth().currentUser?.email
        // Now set the emailLabel
        self.emailLbl.text = userRef
        print("This is the email from MeVC of Auth User: \(emailLbl.text)")
        DataService.instance.getPic(userEmail: self.emailLbl.text!) { (data) in
            for item in data{
                self.profileImage.image = UIImage(named: item)
                print(item)
            }
        }
    }
    
    // This loads a static profile image
    func loadImage() {
  
        // This will be set in the singleton and sent to the DB to update
        profileImage.image = UIImage(named: UserDataService.instance.profilePic)
    }
    
    func imageDidLoad() {
        // This should make a call to the DB and retrieve pic
        profileImage.image = UIImage(named: UserDataService.instance.profilePic)
    }
}
