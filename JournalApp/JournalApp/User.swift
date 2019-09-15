//
//  User.swift
//  JournalApp
//
//  Created by Yousef Ahmed on 9/14/19.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var memories: String = ""
    @objc dynamic var todaysQuestions: String = ""
    @objc dynamic var currentDate = 0
    @objc dynamic var name = ""
    @objc dynamic var created = Date()
    @objc dynamic var sentiment = "0"
}
