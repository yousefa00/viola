//
//  ArchiveVC.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/15/19.
//

import Foundation
import UIKit
import RealmSwift

class ArchiveVC: UIViewController{
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var sentimentLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    private var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // pickerView.delegate = self
        // pickerView.dataSource = self
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
            
            var temp = ""
            var mem = Memory(stringForm: user.memories)
            for char in user.memories {
                if (char == "{") {
                    temp = ""
                } else if char == "}" {
                    mem = Memory(stringForm: temp)
                } else if char != "="{
                    temp += String(char)
                }
            }
            
            qLabel.text = mem.question.getQString()
            answerLabel.text = mem.answer
            date.text = mem.dateString
        }
        
        
        
        
    }
}
