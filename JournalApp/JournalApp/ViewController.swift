//
//  ViewController.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
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
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }


}

