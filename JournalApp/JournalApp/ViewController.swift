//
//  ViewController.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    private var questionArray: [Question] = [Question(question: "What do you feel proud of?"), Question(question: "What do you feel accomplished of?"), Question(question: "What do you feel sad about?"), Question(question: "What do you feel happy about?"), Question(question: "What is something you did today that you've almost never done before?")]
    private var todayQuestionArray:[Question] = []
    private var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        if realm.objects(User.self).count == 0 {
            try! realm.write {
                let newUser = User()
                newUser.name = "Yousef"
                realm.add(newUser)
                user = newUser
            }
        } else {
            user = realm.objects(User.self)[0]
            print(user.name)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        print(Date().timeIntervalSinceReferenceDate)
        print(user.currentDate)
        if (user.currentDate != calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)) {
            questionGenerator()
            let realm = try! Realm()
            try! realm.write {
                user.currentDate = calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)
                for question in todayQuestionArray {
                    user.todaysQuestions += question.getQString() + "_"
                }
            }
        }
    }
    
    func questionGenerator () {
        var numbers: [Int] = []
        while (numbers.count < 5) {
            let number = Int.random(in: 0 ..< questionArray.count)
            if !numbers.contains(number) {
                numbers.append(number)
            }
        }
        for i in numbers {
            todayQuestionArray.append(questionArray[i])
        }
    }
    
    func calcDayFromTime (time: TimeInterval) -> Int {
        return Int(time)/(24 * 60 * 60)
    }


}

