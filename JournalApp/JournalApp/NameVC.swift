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
        
    }
    
    @IBAction func nameSubmitted(_ sender: Any) {
        if (nameField.text! != "") {
            performSegue(withIdentifier: "segue1", sender: nameField.text!)
        }
    }
    
}

