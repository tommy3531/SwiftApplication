//
//  LoginVC.swift
//  breakpoint
//
//  Created by Tom Marler on 1/17/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let profileVC = ProfileViewController()
    
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func addProfileImage(_ sender: Any) {

        performSegue(withIdentifier: "TO_PROFILEVC", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
    }
    
    // This gets the image as a string from Singleton
    // Then converts string t image
    // Then add string 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDataService.instance.profilePic != "" {
            profileImage.image = UIImage(named: UserDataService.instance.profilePic)
        }

//        let imageString = UserDataService.instance.profilePic
//        let stringToImage = UIImage(named: "\(imageString)")
//        let profileImage = UIImageView(image: stringToImage)
//        print("This is from viewWillAppear")
//        profileImage.image = stringToImage
//        print(imageString)
//        print(profileImage)
    }
    
    
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && (passwordField.text != nil) && profileImage.image != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, profilePic: UserDataService.instance.profilePic, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("User Registered")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate { }
