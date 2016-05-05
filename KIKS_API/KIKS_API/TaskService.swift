//
//  TaskService.swift
//  KIKS_API
//
//  Created by tanmartu on 23.4.2016.
//  Copyright © 2016 KiksOy. All rights reserved.
//

import UIKit

class TaskService {
    
    var settings: Settings!
    
    init(){
        self.settings = Settings()
    }
    
    func getTasks(callback:(NSDictionary)->()) {
        request(settings.getTasks,callback: callback)
    }
    
    func request(url:String,callback:(NSDictionary)->()) {
        let nsURL = NSURL(string: url)
        print(callback)
        
        let session = NSURLSession.sharedSession()
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(nsURL!, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let taskString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(taskString)
                    
                    
                    // Parse the JSON to get the IP
                    let response = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    callback(response)
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }
}
