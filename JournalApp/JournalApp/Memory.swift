//
//  Memory.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation


class Memory {
    
    public var userState = 0
    public var question: Question
    public var answer = ""
    public var audioFile = 0
    public var state = 0 // 0 is not ready, 1 is pooled, 2 is archived
    public var string = ""
    public var dateString = ""
    public var dateInt = 0
    public var sentiment = -1
    
    init(question: Question, answer: String, dateInt: Int, dateString: String) {
        self.question = question
        self.answer = answer
        self.dateInt = dateInt
        self.dateString = dateString
    }
    
    init(stringForm: String) {
        var tempArray : [String] = []
        var temp = ""
        for char in stringForm {
            if (char != "{") {
                if (char != "=") {
                    temp += String(char)
                } else {
                    tempArray.append(temp)
                    temp = ""
                }
            }
        }
        dateInt = Int(tempArray[0]) ?? 0
        dateString = tempArray[1]
        question = Question(question: tempArray[2])
        answer = tempArray[3]
    }
    
    func returnStringForm () -> String {
        return "{" + String(dateInt) + "=" + dateString + "=" + question.getQString() + "=" + answer + "=}"
    }
}
