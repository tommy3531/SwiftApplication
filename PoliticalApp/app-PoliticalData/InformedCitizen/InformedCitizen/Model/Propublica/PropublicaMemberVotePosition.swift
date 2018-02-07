//
//  PropublicaMemberVotePosition.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/1/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation

struct PropublicaMemberVotePosition {
    
    // Votes Array
    var memberID: String?
    var chamber: String?
    var congress: String?
    var session: String?
    var rollCall: String?
    var voteURI: String?
    
    // Bill Dictionary
    var billID: String?
    var number: String?
    var billURI: String?
    var title: String?
    var latestAction: String?
    
    var description: String?
    var question: String?
    var result: String?
    var date: String?
    var time: String?
    
    // Total Dictionary
    var yes: String?
    var no: String?
    var present: String?
    var notVoting: String?
    
    var position: String?
    
    init() {}
    
    init(memberid: String, chamber: String, congress: String, session: String, rollcall: String, voteuri: String, billid: String, number: String, billuri: String, title: String, latestaction: String, description: String, question: String, result: String, date: String, time: String, yes: String, no: String, present: String, notvoting: String, position: String) {
        
        self.memberID = memberid
        self.chamber = chamber
        self.congress = congress
        self.session = session
        self.rollCall = rollcall
        self.voteURI = voteuri
        self.billID = billid
        self.number = number
        self.billURI = billuri
        self.title = title
        self.latestAction = latestaction
        self.description = description
        self.question = question
        self.result = result
        self.date = date
        self.time = time
        self.yes = yes
        self.no = no
        self.present = present
        self.notVoting = notvoting
        self.position = position
        
    }
}
