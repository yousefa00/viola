//
//  Question.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation


class Question {
    
    var qString = "What's on your mind?"
    
    init (question: String) {
        qString = question
    }
    
    func getQString() -> String {
        return qString
    }
    
}
