//
//  TextChangeVC.swift
//  LalsinghaniNirav-HW3
//
//  Created by Nirav Lalsinghani on 9/22/20.
//  Copyright © 2020 Nirav Lalsinghani. All rights reserved.
//

import UIKit

class TextChangeVC: UIViewController {
    
    var vc2NewName = ""
    var delegate: UIViewController!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = vc2NewName

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let otherVC = delegate as! TextChanger
        otherVC.changeText(newName: textField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    

}
