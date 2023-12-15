//
//
// Filename: CalculateViewController LalsinghaniNirav-HW4
// EID: NVL225
// Course: CS371L
//
// Created
//
//  Created by Nirav Lalsinghani on 10/6/20.
//  Copyright © 2020 Nirav Lalsinghani. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var operand1: UITextField!
    @IBOutlet weak var operand2: UITextField!
    @IBOutlet weak var op: UILabel!
    @IBOutlet weak var result: UILabel!
    
    var selectedOp = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       let index = dataSource.firstIndex(of: selectedOp)
       op.text = ops[index!]
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let op1 = Float(operand1.text!)
        let op2 = Float(operand2.text!)
        if(op1 == nil || op2 == nil){
            result.text = "Invalids Operands!"
        }
        else if(op.text == "+"){
            result.text = "\(op1! + op2!)"
        }
        else if(op.text == "-"){
            result.text = "\(op1! - op2!)"
        }
        else if(op.text == "*"){
            result.text = "\(op1! * op2!)"
        }
        else if(op.text == "/"){
            result.text = "\(op1! / op2!)"
        }
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
