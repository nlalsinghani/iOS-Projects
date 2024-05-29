//
//  Filename: LalsinghaniNirav-HW8 (ViewController.swift)
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 11/2/20.
//  Copyright 2020. All rights reserved
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate{

    @IBOutlet weak var imageButton: UIButton!
    let ut = UIImage(named: "ut.png")
    let utTower = UIImage(named: "uttower")
    var buttonState = "ut"
    var clicks = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
    }

    @IBAction func buttonPressed(_ sender: Any) {
        clicks = clicks + 1
        if(clicks % 4 == 0){
            let notification = UNMutableNotificationContent()
            notification.title = "Click Count"
            notification.subtitle = "Keep Clicking!"
            notification.body = "You have clicked \(clicks) times"
            let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
            let request = UNNotificationRequest(identifier: "notification", content: notification, trigger: notificationTrigger)
            UNUserNotificationCenter.current().add(request){
                (error) in
                print("Request error:", error as Any)
            }
        }
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: .curveEaseOut,
            animations: {
                self.imageButton.alpha = 0
            },
            completion: {_ in self.step2()})
    }
    
    func step2(){
        if(buttonState == "ut"){
            buttonState = "utTower"
            imageButton.setBackgroundImage(UIImage(named: "uttower.png"), for: UIControl.State.normal)
        }
        else if(buttonState == "utTower"){
            buttonState = "ut"
            imageButton.setBackgroundImage(UIImage(named: "ut.png"), for: UIControl.State.normal)
        }
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                self.imageButton.alpha = 1.0
            },
            completion: nil
        )
    }
    
}

