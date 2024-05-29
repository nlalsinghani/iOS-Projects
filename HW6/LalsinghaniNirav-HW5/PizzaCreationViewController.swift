//
//
// Filename: LalsinghaniNirav-HW5 (PizzaCreationViewController.swftt)
// EID: NVL225
// Course: CS371L
//
// Created by Nirav Lalsinghani on 10/13/20.
// Copyright 2020. All rights reserved.
//

import UIKit

class PizzaCreationViewController: UIViewController {
    
    var pSize = "Small"
    var crust = ""
    var cheese = ""
    var meat = ""
    var veggies = ""
    @IBOutlet weak var pizzaOrder: UILabel!
    var delegate:UIViewController!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sizeButtonPressed(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pSize = "Small"
        case 1:
            pSize = "Medium"
        case 2:
            pSize = "Large"
        default:
            pSize = "Small"
        }
    }
    
    @IBAction func crustButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title : "Select Crust", message: "Choose a crust type", preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Thin Crust", style: .default, handler: {action in self.setCrust(crustType: "Thin Crust")}))
        controller.addAction(UIAlertAction(title: "Thick Crust", style: .default, handler: {action in self.setCrust(crustType: "Thick Crust")}))
        present(controller, animated: true, completion: nil)
    }

    @IBAction func cheeseButtonPressed(_ sender: Any) {
        let controller = UIAlertController(title: "Select Cheese", message: "Choose a cheese type", preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "Regular Cheese", style: .default, handler: {action in self.setCheese(cheeseType: "Regular Cheese")}))
        controller.addAction(UIAlertAction(title: "No Cheese", style: .default, handler: {action in self.setCheese(cheeseType: "No Cheese")}))
        controller.addAction(UIAlertAction(title: "Double Cheese", style: .default, handler:{action in self.setCheese(cheeseType: "Double Cheese")}))
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func meatButtonPressed(_ sender: Any) {
        let controller = UIAlertController(title: "Select Meat", message: "Choose one meat", preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "Pepperoni", style: .default, handler: {action in self.setMeat(meatType: "Pepperoni")}))
        controller.addAction(UIAlertAction(title: "Sausage", style: .default, handler: {action in self.setMeat(meatType: "Sausage")}))
        controller.addAction(UIAlertAction(title: "Canadian Bacon", style: .default, handler: {action in self.setMeat(meatType: "Canadian Bacon")}))
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func veggieButtonPressed(_ sender: Any) {
        let controller = UIAlertController(title: "Select Veggies", message: "Choose your veggies", preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "Mushroom", style: .default, handler: {action in self.setVeggies(veggiesType: "Mushroom")}))
        controller.addAction(UIAlertAction(title: "Onion", style: .default, handler: {action in self.setVeggies(veggiesType: "Onion")}))
        controller.addAction(UIAlertAction(title: "Green Olive", style: .default, handler: {action in self.setVeggies(veggiesType: "Green Olive")}))
        controller.addAction(UIAlertAction(title: "Black Olive", style: .default, handler: {action in self.setVeggies(veggiesType: "Black Olive")}))
        controller.addAction(UIAlertAction(title: "None", style: .default, handler: {action in self.setVeggies(veggiesType: "None")}))
        present(controller, animated: true, completion: nil)
    }
    
    func setCrust(crustType: String){
        crust = crustType
    }
    
    func setCheese(cheeseType: String){
        cheese = cheeseType
    }
    
    func setMeat(meatType: String){
        meat = meatType
    }
    func setVeggies(veggiesType: String){
        veggies = veggiesType
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if(crust == ""){
            let controller = UIAlertController(title: "Missing Ingredient", message: "Please select a crust", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        if(cheese == ""){
            let controller = UIAlertController(title: "Missing Ingredient", message: "Please select a cheese", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        else if(meat == ""){
            let controller = UIAlertController(title: "Missing Ingredient", message: "Please select a meat", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        else if(veggies == ""){
            let controller = UIAlertController(title: "Missing Ingredient", message: "Please select a veggie", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        else{
            let pizza = Pizza(pSize: pSize, crust: crust, cheese: cheese, meat: meat, veggies: veggies)
            let otherVC = delegate as! addPizza
            otherVC.appendPizza(newPizza: pizza)
            self.dismiss(animated: true, completion: nil)
            pizzaOrder.text = pizza.pSize + "\n" + pizza.crust + "\n" + pizza.cheese + "\n" + pizza.meat + "\n" + pizza.veggies
        }
        
    }

}
