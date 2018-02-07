//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Tom Marler on 1/18/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
        loadImageOnStartUp()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("There was an error")
                }
            })
        }
    }
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = ""
        
    }
}
