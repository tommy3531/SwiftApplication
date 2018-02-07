//
//  UserDataService.swift
//  breakpoint
//
//  Created by Tom Marler on 1/27/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var profilePic = ""
    public private(set) var email = ""
    public private(set) var username = ""
    
    func setUserData(username: String, email: String, profilePic: String){
        self.profilePic = profilePic
        self.email = email
        self.username = username
    }
    
    func setProfilePic(profilepic: String) {
        self.profilePic = profilepic
    }
    
    func getProfilePic() -> String {
        return self.profilePic
    }
    
    func logOut() {
        username = ""
        profilePic = ""
        email = ""
    
    }
}
