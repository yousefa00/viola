//
//  ViewController.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    private var questionArray: [Question] = [Question(question: "What do you feel proud of?"), Question(question: "What do you feel accomplished of?"), Question(question: "What do you feel sad about?"), Question(question: "What do you feel happy about?"), Question(question: "What is something you did today that you rarely do?"), Question(question: "Something/someone you're grateful for?"), Question(question: "Any instances of good/bad luck?"), Question(question: "What would you do if you had an extra hour today?"), Question(question: "Most important thing you accomplished today?"), Question(question: "Hardest thing about today?"), Question(question: "Anything that needs to be finished some other day?"), Question(question: "How did you feel today?"), Question(question: "Did you enjoy your meals today?"), Question(question: "What did you do for self care?"), Question(question: "Did you have to make any sacrifices today?"), Question(question: "Any good new music?")]
    private var todayQuestionArray:[Question] = []
    private var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pickerView.delegate = self
//        pickerView.dataSource = self
        
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

