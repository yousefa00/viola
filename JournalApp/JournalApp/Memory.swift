//
//  Memory.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation


class Memory {
    
    var userState = 0
    var question: Question?
    var answer = 0
    var freeWrite = 0
    var audioFile = 0
    var state = 0 // 0 is not ready, 1 is pooled, 2 is archived
    
    init() {
        
    }
}
