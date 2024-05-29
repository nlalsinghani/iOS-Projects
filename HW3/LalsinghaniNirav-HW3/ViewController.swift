//
//  Filename: LalsinghaniNirav-HW3
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 9/22/20.
//  Copyright © 2020 Nirav Lalsinghani. All rights reserved.
//

import UIKit

protocol TextChanger {
    func changeText(newName:String)
}

protocol ColorChanger {
    func changeColor(newColor:UIColor)
}

class ViewController: UIViewController, TextChanger, ColorChanger{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToText",
            let nextVC = segue.destination as? TextChangeVC
            {
                nextVC.delegate = self;
                nextVC.vc2NewName = textLabel.text!
        }
        if segue.identifier == "SegueToColor",
            let nextVC = segue.destination as? ColorChangeVC
            {
                nextVC.delegate = self;
        }
    }
    
    
    func changeText(newName: String){
        textLabel.text = newName
    }
    
    func changeColor(newColor: UIColor){
        textLabel.backgroundColor = newColor
    }


}

