//
//  SettingsVC.swift
//  JournalApp
//
//  Created by Kevin Mao on 9/15/19.
//
import UIKit
import Foundation

class SettingsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var timeOptions: UIPickerView!

    let times = ["1 week", "2 weeks", "1 month", "3 months", "6 months", "1 year"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // pickerView.delegate = self
       // pickerView.dataSource = self

        print(Date.init())

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return times[row]
    }
}
