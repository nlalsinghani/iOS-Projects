//
//  ColorChangeVC.swift
//  LalsinghaniNirav-HW3
//
//  Created by Nirav Lalsinghani on 9/22/20.
//  Copyright © 2020 Nirav Lalsinghani. All rights reserved.
//

import UIKit

class ColorChangeVC: UIViewController {
    
    var delegate:UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func blueButtonPressed(_ sender: Any) {
        let otherVC = delegate as! ColorChanger
        otherVC.changeColor(newColor: UIColor.blue)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func redButtonPressed(_ sender: Any) {
        let otherVC = delegate as! ColorChanger
        otherVC.changeColor(newColor: UIColor.red)
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
