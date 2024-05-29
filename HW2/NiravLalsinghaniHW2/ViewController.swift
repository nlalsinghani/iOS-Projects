//
//Filename: NiravLalsinghaniHW2
//EID: NVL225
//Course: CS371L
//
//Created by Nirav Lalsinghani on 09/15/2020
//Copyright 2020. All rights reserved
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let username = userTextField.text!
        let password = passTextField.text!
        var message = ""
        if(username == "" || password == ""){
            message = "Invalid Login"
        }
        else{
            message = username + " logged in"
        }
        statusLabel.text = message
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

