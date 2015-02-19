//
//  LoginVC.swift
//  Shopping With Friends
//
//  Created by Hanbeen Kim on 2/13/15.
//  Copyright (c) 2015 CS2340. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {


    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func singInClicked(sender: UIButton) {
        var username:NSString = txtUsername.text as NSString
        var password:NSString = txtPassword.text as NSString
        var users:Dictionary<NSString, NSString> = AppDelegate().getUsers()
        
        if (users[username] == password) {
            NSLog("Login Sucess")
    
            var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            prefs.setObject(username, forKey: "USERNAME")
            prefs.setInteger(1, forKey: "ISLOGGEDIN")
            prefs.synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Login Failed!"
            alertView.message = "Wrong username or password"
            alertView.delegate = self
            alertView.addButtonWithTitle("Dismiss")
            alertView.show()
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
