//
//  FreeWriteVC.swift
//  JournalApp
//
//  Created by Rajat Mittal on 9/15/19.
//

import Foundation
import UIKit
import RealmSwift

class FreeWriteVC: UIViewController {
    
    private var user: User!
    
    private var questionArray: [String] = []
    private var currentQ = -1
    
    @IBOutlet weak var free: UITextView!
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
        
        if (user.currentDate != calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)) {
            let realm = try! Realm()
            try! realm.write {
                user.currentDate = calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)
            }
            // DO SOME CODE THAT GOES BACK TO THE PREVIOUS VC
        } else {
            
        }
    }
    
    func calcDayFromTime (time: TimeInterval) -> Int {
        return Int(time)/(24*60*60)
    }
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        var sample = ""
        let json: [String: Any] = ["documents": [["id":"1", "language":"en", "text": free.text!]]]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "https://viola.cognitiveservices.azure.com//text/analytics/v2.1/sentiment")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("06cee61bd83746bdbc40037c3d4c84fd", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
            sample = responseJSON as! String
        }
        
        task.resume()
        assembleSentimentView(response: sample)
        
        

    }
    
    func assembleSentimentView(response: String) {
        
    }
}
