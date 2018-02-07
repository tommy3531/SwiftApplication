//
//  PropublicaMembersLeavingOfficeModel.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/1/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

struct PropublicaMembersLeavingOfficeModel {
    
    var id: String?
    var apiURI: String?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var suffix: String?
    var party: String?
    var state: String?
    var district: String?
    var beginDate: String?
    var endDate: String?
    var status: String?
    var note: String?
    
    init() {}
    
    init(id: String, apiuri: String, firstname: String, middlename: String, lastname: String, suffix: String, party: String, state: String, district: String, begindate: String, endate: String, status: String, note: String) {
        
        self.id = id
        self.apiURI = apiuri
        self.firstName = firstname
        self.middleName = middlename
        self.lastName = lastname
        self.suffix = suffix
        self.party = party
        self.state = state
        self.district = district
        self.beginDate = begindate
        self.endDate = endate
        self.status = status
        self.note = note
        
    }
}
