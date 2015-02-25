//
//  RegisterVC.swift
//  Shopping With Friends
//
//  Created by Hanbeen Kim on 2/13/15.
//  Copyright (c) 2015 CS2340. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmClicked(sender: UIButton) {
        var username = txtUsername.text
        var password = txtPassword.text
        var confirmPassword = txtConfirmPassword.text
        var email = txtEmail.text
        var name = txtName.text
        
        func userSignUp() {
            var user = PFUser()
            user.username = username
            user.password = password
            //user.email = email
            
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "saved!"
                    alertView.message = "Success!"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("Dismiss")
                    alertView.show()
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Registration Failed!"
                    alertView.message = "Try again"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("Dismiss")
                    alertView.show()
                    // Show the errorString somewhere and let the user try again.
                }
            }
        }

        if ( username == "" || password == "" ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Registration Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("Dismiss")
            alertView.show()
            
        } else if ( password != confirmPassword ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Registration Failed!"
            alertView.message = "Password Does Not Match"
            alertView.delegate = self
            alertView.addButtonWithTitle("Dismiss")
            alertView.show()
        
        } else {
            userSignUp()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
