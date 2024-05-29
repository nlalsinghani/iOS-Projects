//
// Filename: LalsinghaniNirav-HW5 (ViewController.swift)
// EID: NVL225
// Course: CS371L
//
// Created by Nirav Lalsinghani on 10/13/20.
// Copyright 2020. All rights reserved.
//

public class Pizza {
    
    var pSize = ""
    var crust = ""
    var cheese = ""
    var meat = ""
    var veggies = ""
    
    init(pSize: String, crust: String, cheese: String, meat: String, veggies: String){
        self.pSize = pSize
        self.crust = crust
        self.cheese = cheese
        self.meat = meat
        self.veggies = veggies
    }
}

import UIKit

protocol addPizza {
    func appendPizza(newPizza: Pizza)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, addPizza{

    @IBOutlet weak var tableView: UITableView!
    var pizzaList:[Pizza] = []
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pizzaSegue",
            let nextVC = segue.destination as? PizzaCreationViewController
            {
                nextVC.delegate = self;
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pizzaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        let row = indexPath.row
        cell.textLabel?.text = pizzaList[row].pSize + "\n" + pizzaList[row].crust + "\n" + pizzaList[row].cheese + "\n" + pizzaList[row].meat + "\n" + pizzaList[row].veggies
        return cell
    }
    
    func appendPizza(newPizza: Pizza){
        pizzaList.append(newPizza)
    }

}

