//
//  Memory.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation


class Memory {
    
    var userState = 0
    var question: Question
    var answer = ""
    var freeWrite = ""
    var audioFile = 0
    var state = 0 // 0 is not ready, 1 is pooled, 2 is archived
    var string = ""
    var dateString = ""
    var dateInt = 0
    
    init(question: Question, answer: String, freeWrite: String, dateInt: Int, dateString: String) {
        self.question = question
        self.answer = answer
        self.freeWrite = freeWrite
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
        freeWrite = tempArray[4]
    }
    
    func returnStringForm () -> String {
        return "{" + String(dateInt) + "=" + dateString + "=" + question.getQString() + "=" + answer + "=" + freeWrite + "=}"
    }
}
