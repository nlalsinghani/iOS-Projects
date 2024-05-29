//
//  AddTimerViewController.swift
//
//  Filename: Lalsinghani-Nirav-HW7 (AddTimerViewController.swift)
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 10/23/20.
//  Copyright 2020. All rights reserved
//

import UIKit

class AddTimerViewController: UIViewController {

    
    var delegate:UIViewController!
    
    @IBOutlet weak var eventText: UITextField!
    @IBOutlet weak var remainingTimeText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        var time = Int(remainingTimeText.text!)
        if(time == nil){
            time = 0
        }
        let timer = Timer(event: eventText.text!, location: locationText.text!, remainingTime: time!)
        let otherVC = delegate as! addTimer
        otherVC.appendTimer(newTimer: timer)
    }

}
