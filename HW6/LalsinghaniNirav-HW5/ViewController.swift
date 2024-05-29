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
import CoreData

protocol addPizza {
    func appendPizza(newPizza: Pizza)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, addPizza{

    @IBOutlet weak var tableView: UITableView!
    var pizzaList:[Pizza] = []
    let textCellIdentifier = "TextCell"
    var fetchedResults:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResults = retrievePizza()
        for piz in fetchedResults {
            if let pizzaCheese = piz.value(forKey: "cheese") as? String {
                if let pizzaCrust = piz.value(forKey: "crust") as? String {
                    if let pizzaMeat = piz.value(forKey: "meat") as? String {
                        if let pizzaPSize = piz.value(forKey: "pSize") as? String {
                            if let pizzaVeggies = piz.value(forKey: "veggies") as? String {
                                let p = Pizza(pSize: pizzaPSize, crust: pizzaCrust, cheese: pizzaCheese, meat: pizzaMeat, veggies: pizzaVeggies)
                                pizzaList.append(p)
                            }
                        }
                    }
                }
            }
        }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        fetchedResults = retrievePizza()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        if editingStyle == .delete{
            print(fetchedResults)
            print("Length: \(fetchedResults.count)")
            print("Index: \(indexPath.row)")
            let commit = fetchedResults[indexPath.row]
            context.delete(commit)
            fetchedResults.remove(at: indexPath.row)
            pizzaList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            do {
                try context.save()
            } catch {
                fatalError("Could not save context: \(error)")
            }
        }
    }
    
    func appendPizza(newPizza: Pizza){
        print("added pizza")
        pizzaList.append(newPizza)
        storePizza(veggies: newPizza.veggies, cheese: newPizza.cheese, crust: newPizza.crust, meat: newPizza.meat, pSize: newPizza.pSize)
    }
    
    func storePizza(veggies: String, cheese: String, crust: String, meat: String, pSize: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let pizza = NSEntityDescription.insertNewObject(forEntityName: "PizzaItem", into:context)
        pizza.setValue(veggies, forKey: "veggies")
        pizza.setValue(cheese, forKey: "cheese")
        pizza.setValue(crust, forKey: "crust")
        pizza.setValue(meat, forKey: "meat")
        pizza.setValue(pSize, forKey: "pSize")
        do{
            try context.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    func retrievePizza() -> [NSManagedObject] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PizzaItem")
        var fetchedResults: [NSManagedObject]? = nil
        do{
            try fetchedResults = context.fetch(request) as? [NSManagedObject]
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        return(fetchedResults)!
    }
    
    func clearCoreData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PizzaItem")
        
        var fetchedResults: [NSManagedObject]
        
        do {
            try fetchedResults = context.fetch(request) as! [NSManagedObject]
            
            if fetchedResults.count > 0 {
                
                for result:AnyObject in fetchedResults {
                    context.delete(result as! NSManagedObject)
                }
            }
            try context.save()
            
        } catch {
            // if an error occurs
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        
    }
}

