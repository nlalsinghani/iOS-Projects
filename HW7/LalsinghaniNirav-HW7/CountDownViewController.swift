//
//  Filename: Lalsinghani-Nirav-HW7 (CountDownViewController.swift)
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 10/23/20.
//  Copyright 2020. All rights reserved
//

import UIKit
import Foundation

class CountDownViewController: UIViewController{

    var delegate:UIViewController!
    var timer:Timer!
    var isTimerRunning = false
    
    @IBOutlet weak var eventText: UILabel!
    @IBOutlet weak var locationText: UILabel!
    @IBOutlet weak var remainingTimeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventText.text = timer.event
        locationText.text = timer.location
        remainingTimeText.text = " \(timer.remainingTime)"
        isTimerRunning = true
        DispatchQueue(label: "timer", qos: .background).async {
            self.timerStart()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isTimerRunning = false
    }
    
    func timerStart(){
        while(self.timer.remainingTime > 0 && self.isTimerRunning){
            sleep(1)
            self.timer.remainingTime = self.timer.remainingTime - 1
            DispatchQueue.main.async{
                self.remainingTimeText.text = "\(self.timer.remainingTime)"
            }
        }
    }

}
