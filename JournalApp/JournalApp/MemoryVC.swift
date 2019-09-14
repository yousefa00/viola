//
//  MemoryVC.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/14/19.
//

import Foundation
import UIKit

class MemoryVC: UIViewController {
    
    @IBOutlet weak var answerField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(Date.init())
        
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        print("clicked")
        print(answerField.text)
    }
}

