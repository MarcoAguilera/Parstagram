//
//  LoginViewController.swift
//  
//
//  Created by Marco Aguilera on 2/26/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.delegate = self
        passwordField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
       
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error \(error?.localizedDescription)")
            }
        }
       
    
    }
    
    @IBAction func onSignUp(_ sender: Any) {
       var user = PFUser()
       user.username = usernameField.text;
       user.password = passwordField.text;
       
       user.signUpInBackground { (success, error) in
           if(success) {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
           }
           else {
               print("Error: \(error?.localizedDescription)" )
           }
       }
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        return true
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
