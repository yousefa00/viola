//
//  User.swift
//  JournalApp
//
//  Created by Yousef Ahmed on 9/14/19.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var memories: [Memory] = []
    @objc dynamic var name = ""
    @objc dynamic var created = Date()
}
