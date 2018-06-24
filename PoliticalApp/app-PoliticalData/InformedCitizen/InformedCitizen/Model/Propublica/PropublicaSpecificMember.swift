//
//  PropublicaNewMember.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/1/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

struct PropublicaSpecificMember {
    
    var id: String?
    var apiURI: String?
    var firstName: String?
    var middelName: String?
    var lastName: String?
    var suffix: String?
    var party: String?
    var chamber: String?
    var state: String?
    var district: String?
    var startDate: String?
    
    init(){}
    
    init(id: String, apiURI: String, firstName: String, middelName: String, lastName: String, suffix: String, party: String, chamber: String, state: String, district: String, startDate: String){
        self.id = id
        self.apiURI = apiURI
        self.firstName = firstName
        self.middelName = middelName
        self.lastName = lastName
        self.suffix = suffix
        self.party = party
        self.chamber = chamber
        self.state = state
        self.district = district
        self.startDate = startDate
    }
}
