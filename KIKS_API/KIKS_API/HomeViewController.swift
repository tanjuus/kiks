//
//  FirstViewController.swift
//  KIKS_API
//
//  Created by tanmartu on 22.4.2016.
//  Copyright © 2016 KiksOy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    @IBAction func moveToLogin(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC")
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appdelegate.window?.rootViewController = loginVC
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "Task"
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Your open tasks:"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

