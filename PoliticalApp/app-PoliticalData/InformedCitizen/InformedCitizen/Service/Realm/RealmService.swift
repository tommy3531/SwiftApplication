//
//  File.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/5/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    func saveObjects(legislatorModel: PropublicaModel) {
        try! realm.write({
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm.add(legislatorModel, update: true)
        })
    }
    
    func saveSpecificObjects(specificMemberModel: PropublicaSpecificMember) {
        try! realm.write({
            
            for i in specificMemberModel.results {
                realm.add(i, update: true)
            }
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm.add(specificMemberModel, update: true)
        })
    }
    
    func getObjects(type: Object.Type) -> Results<Object>? {
        return realm.objects(type)
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
}

