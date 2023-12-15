//
//
// Filename: ViewController.swift LalsinghaniNirav-HW4
// EID: NVL225
// Course: CS371L
//
//
//  Created by Nirav Lalsinghani on 10/6/20.
//  Copyright © 2020 Nirav Lalsinghani. All rights reserved.
//

import UIKit

public let dataSource = ["Add", "Subtract", "Multiply", "Divide"]

public let ops = ["+", "-", "*", "/"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "TextCell"
    let segueIdentifier = "OpSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        let row = indexPath.row
        cell.textLabel?.text = dataSource[row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
            let destination = segue.destination as? CalculateViewController,
            let i = tableView.indexPathForSelectedRow?.row {
            destination.selectedOp = dataSource[i]
        }
    }


}

