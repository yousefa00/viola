//
//  MemoryVC.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation
import UIKit
import RealmSwift

class MemoryVC: UIViewController {
    
    @IBOutlet weak var answerField: UITextView!
    private var user: User!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        print(user.currentDate)
        print(Date().timeIntervalSinceReferenceDate)
        if (user.currentDate != calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)) {
            let realm = try! Realm()
            try! realm.write {
                user.currentDate = calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)
            }
            // DO SOME CODE THAT GOES BACK TO THE PREVIOUS VC
        } else {
            questionLabel.text = user.todaysQuestions
        }
    }
    
    func calcDayFromTime (time: TimeInterval) -> Int {
        return Int(time)/(24*60*60)
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        print("clicked")
        print(answerField.text)
    }
}

