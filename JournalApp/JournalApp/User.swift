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
    dynamic var todaysQuestions: [Question] = []
    dynamic var currentDate = 0
    @objc dynamic var name = ""
    @objc dynamic var created = Date()
}
