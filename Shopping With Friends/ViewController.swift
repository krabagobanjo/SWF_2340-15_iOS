//
//  ViewController.swift
//  Shopping With Friends
//
//  Created by Hanbeen Kim on 2/12/15.
//  Copyright (c) 2015 CS2340. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameShow: UILabel!

    @IBAction func logOut(sender: UIButton) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("goto_welcomePage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            self.usernameShow.text = currentUser.username
        } else {
            self.performSegueWithIdentifier("goto_welcomePage", sender: self)
        }
    }

    @IBAction func logoutClicked(sender: UIButton) {
        PFUser.logOut()
        var currentUser = PFUser.currentUser()
        self.performSegueWithIdentifier("goto_welcomePage", sender: self)
    }


}

