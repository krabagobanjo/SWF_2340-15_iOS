//
//  FriendVC.swift
//  Shopping With Friends
//
//  Created by Hanbeen Kim on 2/25/15.
//  Copyright (c) 2015 CS2340. All rights reserved.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var friendUsername: UITextField!
    @IBOutlet weak var friendEmail: UITextField!

    @IBAction func addFriend(sender: UIButton) {
        var username = friendUsername.text
        var email = friendEmail.text
        
        var query = PFUser.query()
        query.whereKey("username", equalTo: username)
        query.whereKey("email", equalTo: email)
        
        var friend = query.findObjects()
        /*var user = NSArray()
        query.findObjectsInBackgroundWithBlock ({(NSArray objects, NSError error) in
            if (error == nil) {
                user = NSArray(array: objects)
            }
        })*/

        if friend.count == 1 {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Friend Added!"
            alertView.message = "\"" + username + "\"" + " is now your Friend!"
            alertView.delegate = self
            alertView.addButtonWithTitle("Dismiss")
            alertView.show()
        } else {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "No Result Found!"
            alertView.message = "\"" + username + "\"" + " does not exist"
            alertView.delegate = self
            alertView.addButtonWithTitle("Dismiss")
            alertView.show()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
