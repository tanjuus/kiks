//
//  LoginViewController.swift
//  KIKS_API
//
//  Created by tanmartu on 23.4.2016.
//  Copyright © 2016 KiksOy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   @IBAction func moveToHomeScreen(sender: UIButton) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBarVC") as!UITabBarController
            let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appdelegate.window?.rootViewController = tabBarController
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
