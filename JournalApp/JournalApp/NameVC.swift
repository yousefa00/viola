//
//  NameVC.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation
import UIKit

class NameVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(Date.init())
        
        let clickViewGesture = UITapGestureRecognizer(target: self, action:  #selector (self.clickView (_:)))
        self.view.addGestureRecognizer(clickViewGesture)
        
    }
    
    @objc func clickView(_ sender:UITapGestureRecognizer){
        if nameField.isFirstResponder {
            nameField.resignFirstResponder()
        }
    }
    
    @IBAction func nameSubmitted(_ sender: Any) {
        if (nameField.text != "") {
            performSegue(withIdentifier: "segue1", sender: nameField.text)
        } else {
            performSegue(withIdentifier: "segue1", sender: nameField.text)
            print("NO NAME SUBMITTED")
        } // remove this once keyboard is working on this screen
    }
}
