//
//  PropublicaCurrentMemberModel.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/1/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

struct PropublicaCurrentMemberByStateModel {
    
    var id: String?
    var name: String?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var suffix: String?
    var role: String?
    var gender: String?
    var party: String?
    var timesTopicsURL: String?
    var twitterID: String?
    var facebookAcount: String?
    var youtubeID: String?
    var seniority: String?
    var nextElection: String?
    var apiURL: String?
    
    init(){}
    
    init(id: String, name: String, firstname: String, middlename: String, lastname: String, suffix: String, role: String, gender: String, party: String, timestopicsurl: String, twitterid: String, facebookaccount: String, youtubeid: String, seniority: String, nextelection: String, apiurl: String) {
        
        self.id = id
        self.name = name
        self.firstName = firstname
        self.middleName = middlename
        self.lastName = lastname
        self.suffix = suffix
        self.role = role
        self.gender = gender
        self.party = party
        self.timesTopicsURL = timestopicsurl
        self.twitterID = twitterid
        self.facebookAcount = facebookaccount
        self.youtubeID = youtubeid
        self.seniority = seniority
        self.nextElection = nextelection
        self.apiURL = apiurl
        
    }
}
