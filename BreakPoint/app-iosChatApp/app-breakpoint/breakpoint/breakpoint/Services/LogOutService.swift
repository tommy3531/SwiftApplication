//
//  Logout.swift
//  breakpoint
//
//  Created by Tom Marler on 1/21/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation
import UIKit
import Firebase


// TODO: THis is terriable do something different
class LogOutService {
    var authVC: AuthVC
//    private let
    
    init(authvc: AuthVC){
        self.authVC = authvc
    }
    
    func logout() {
        
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        print("Hey")
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                self.authVC.present(self.authVC, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        authVC.present(logoutPopup, animated: true, completion: nil)
    }
}
