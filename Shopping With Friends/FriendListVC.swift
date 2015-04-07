//
//  FriendListVC.swift
//  Shopping With Friends
//
//  Created by Hanbeen Kim on 3/17/15.
//  Copyright (c) 2015 CS2340. All rights reserved.
//

import UIKit

class FriendListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var friendTable: UITableView!
    var friends: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.friends.addObject("h")
        self.friends.addObject("k")
        self.friends.addObject("b")
        
        self.friendTable.rowHeight = UITableViewAutomaticDimension
        self.friendTable.estimatedRowHeight = 44.0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.friendTable.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.friends.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    
}
