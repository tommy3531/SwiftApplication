//
//  User.swift
//  breakpoint
//
//  Created by Tom Marler on 1/21/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

class User {
    
    var uid: String?
    var providerID: String?
    var emailID: String?
    var profilePic: String?
    
    init(){}
    
    init(uid: String, providerID: String, emailID: String, profilePic: String) {
        self.uid = uid
        self.providerID = providerID
        self.emailID = emailID
        self.profilePic = profilePic
    }
}
