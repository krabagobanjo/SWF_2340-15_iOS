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
    var users = Dictionary<NSString, NSString>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUsers() -> Dictionary<NSString, NSString> {
        return users
    }
    
    @IBAction func confirmClicked(sender: UIButton) {
        var username:NSString = txtUsername.text as NSString
        var password:NSString = txtPassword.text as NSString
        var confirmPassword:NSString = txtConfirmPassword.text as NSString
        
        if ( username == "" || password == "" ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Registration Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        } else if ( !password.isEqualToString(confirmPassword) ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Registration Failed!"
            alertView.message = "Password Does Not Match"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        
        } else {
            users.updateValue(password, forKey: username)
            AppDelegate().setUsers(users)
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
