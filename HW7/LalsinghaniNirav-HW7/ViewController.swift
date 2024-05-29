//
//  Filename: Lalsinghani-Nirav-HW7 (ViewController.swift)
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 10/23/20.
//  Copyright 2020. All rights reserved
//

public class Timer{
    
    var event = ""
    var location = ""
    var remainingTime = 0
    
    init(event: String, location: String, remainingTime: Int){
        self.event = event
        self.location = location
        self.remainingTime = remainingTime
    }
}

class TimerTableViewCell: UITableViewCell{
    @IBOutlet weak var eventTextLabel: UILabel!
    @IBOutlet weak var locationTextLabel: UILabel!
    @IBOutlet weak var remainingTimeTextLabel: UILabel!
}

import UIKit

protocol addTimer {
    func appendTimer(newTimer : Timer)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, addTimer {
    
    var timerList:[Timer] = []
    var selectedIndex = 0
    let textCellIdentifier = "TimerTable-ViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath) as! TimerTableViewCell
        let row = indexPath.row
        cell.eventTextLabel?.text = timerList[row].event
        cell.locationTextLabel?.text = timerList[row].location
        cell.remainingTimeTextLabel?.text = " \(timerList[row].remainingTime)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "countdownSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timerSegue",
            let nextVC = segue.destination as? AddTimerViewController
            {
                nextVC.delegate = self
        }
        if segue.identifier == "countdownSegue",
           let nextVC = segue.destination as? CountDownViewController
        {
            nextVC.delegate = self
            nextVC.timer = self.timerList[selectedIndex]
        }
    }
    
    func appendTimer(newTimer: Timer) {
        timerList.append(newTimer)
    }

}

