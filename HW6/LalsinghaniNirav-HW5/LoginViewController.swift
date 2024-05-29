//
// Filename: LalsinghaniNirav-HW5 (LoginViewController.swift)
// EID: NVL225
// Course: CS371L
//
// Created by Nirav Lalsinghani on 10/20/20.
// Copyright 2020. All rights reserved.
//
import Firebase
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signInUp: UISegmentedControl!
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var confirmText: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmText.isHidden = true
        confirmLabel.isHidden = true
        signInButton.setTitle("Sign In", for: .normal)
        status.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInUpPressed(_ sender: Any) {
        switch signInUp.selectedSegmentIndex {
        case 0:
            confirmText.isHidden = true
            confirmLabel.isHidden = true
            signInButton.setTitle("Sign In", for: .normal)
        case 1:
            confirmLabel.isHidden = false
            confirmText.isHidden = false
            signInButton.setTitle("Sign Up", for: .normal)
        default:
            confirmText.isHidden = true
            confirmLabel.isHidden = true
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
    @IBAction func loginIn(_ sender: Any) {
        if(signInButton.titleLabel?.text == "Sign In"){
            guard let username = username.text,
                  let password = password.text,
                  username.count > 0,
                  password.count > 0
            else{
                return
            }
            Auth.auth().signIn(withEmail: username, password: password){
                user, error in
                if let _ = error, user == nil {
                    self.status.text = "Sign in Failed"
                }
                else{
                    self.status.text = ""
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        }
        else{
            let usernameText = username.text!
            let passwordText = password.text!
            let confirmPasswordText = confirmPassword.text!
            if(confirmPasswordText != passwordText){
                self.status.text = "Passwords do not match"
            }
            else{
                Auth.auth().createUser(withEmail: usernameText, password: passwordText){
                    user, error in
                    if error == nil{
                        Auth.auth().signIn(withEmail: self.username.text!, password: self.password.text!)
                        self.status.text = ""
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    }
                    else{
                        self.status.text = error?.localizedDescription
                    }
                }
            }
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
