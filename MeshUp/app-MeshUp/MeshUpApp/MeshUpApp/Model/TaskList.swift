//
//  TaskList.swift
//  MeshUpApp
//
//  Created by Tom Marler on 1/23/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation
import RealmSwift

class TaskList: Object {
    @objc dynamic var text = ""
    @objc dynamic var id = ""
    let items = List<Task>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
