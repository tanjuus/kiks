//
//  BrowseTasksViewControllerTableViewController.swift
//  KIKS_API
//
//  Created by tanmartu on 23.4.2016.
//  Copyright © 2016 KiksOy. All rights reserved.
//

import UIKit

class BrowseTasksViewController: UITableViewController  {
    
    var taskCollection = [Task]()
    var service:TaskService!
    
    //MARK: - viewcontroller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = TaskService()
        service.getTasks {
            (response) in
            self.loadTasks(response["items"]! as! NSArray)
        }
    }
    func loadTasks(items:NSArray) {
        for item in items {
            let taskId = item["taskId"]!
            let description = item["description"]!
            let taskObj =  Task(taskId: taskId!)
            print("Task \(taskId!):\(description!)")
            taskCollection.append(taskObj)
        }
        doTableRefresh()
    }
    
    func doTableRefresh() {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskCollection.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let object = taskCollection[indexPath.row]
        cell.textLabel!.text = object.taskId as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "#Cooking"
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
         if editingStyle == .Delete {
         // Delete the row from the data source
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
         } else if editingStyle == .Insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
