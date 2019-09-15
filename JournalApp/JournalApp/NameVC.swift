//
//  NameVC.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation
import UIKit
import RealmSwift

class NameVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    private var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let realm = try! Realm()
        print(realm.objects(User.self).count)
        if realm.objects(User.self).count == 0 {
            try! realm.write {
                let newUser = User()
                realm.add(newUser)
                user = newUser
            }
        } else {
            user = realm.objects(User.self)[0]
            print("running")
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let clickViewGesture = UITapGestureRecognizer(target: self, action:  #selector (self.clickView (_:)))
        self.view.addGestureRecognizer(clickViewGesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (user.name != "") {
            performSegue(withIdentifier: "segue1", sender: nameField.text)
        }
    }
    
    @objc func clickView(_ sender:UITapGestureRecognizer){
        if nameField.isFirstResponder {
            nameField.resignFirstResponder()
        }
    }
    
    @IBAction func nameSubmittedViaKeyboard(_ sender: Any) {
        if nameField.isFirstResponder {
            nameField.resignFirstResponder()
        }
        if (nameField.text != "") {
            let realm = try! Realm()
            try! realm.write {
                user.name = nameField.text!
            }
            performSegue(withIdentifier: "segue1", sender: nameField.text)
        } 
    }
    
    @IBAction func nameSubmitted(_ sender: Any) {
        if (nameField.text != "") {
            let realm = try! Realm()
            try! realm.write {
                user.name = nameField.text!
            }
            performSegue(withIdentifier: "segue1", sender: nameField.text)
        } 
    }
}
