//
//  Task.swift
//  MeshUpApp
//
//  Created by Tom Marler on 1/23/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation
import RealmSwift

final class Task: Object {
    @objc dynamic var text = ""
    @objc dynamic var completed = false
}
