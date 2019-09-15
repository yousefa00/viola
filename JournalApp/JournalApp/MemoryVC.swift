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
        print(Date().timeIntervalSinceReferenceDate)
        if (user.currentDate != calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)) {
            user.currentDate = calcDayFromTime(time: Date().timeIntervalSinceReferenceDate)
            // DO SOME CODE THAT GOES BACK TO THE PREVIOUS VC
        }
        //questionLabel.text = user.todaysQuestions[0].getQString()
    }
    
    func calcDayFromTime (time: TimeInterval) -> Int {
        return Int(time)/24
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        let json: [String: Any] = ["documents": [["id":"1", "language":"en", "text": answerField.text!]]]

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
        }

        task.resume()
        print(answerField.text)
    }
}

