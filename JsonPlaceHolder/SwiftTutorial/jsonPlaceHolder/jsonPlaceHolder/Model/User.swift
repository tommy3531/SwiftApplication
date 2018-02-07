//
//  User.swift
//  jsonPlaceHolder
//
//  Created by Tom Marler on 1/14/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

struct User : Decodable {
    
    var id :Int
    var name :String
    var username :String
    var email :String
    
    //init(){}
    
    init(id :Int, name :String, username :String, email :String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
    }

}
