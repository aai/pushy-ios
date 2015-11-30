//
//  ViewController.swift
//  notify
//
//  Created by Mark Madsen on 2014-11-11.
//  Copyright (c) 2014 Mark Madsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var PROJECT = "e5d47af0-5ab9-4229-a467-b78ab2516780"
    
    @IBOutlet weak var device_uuid_field: UITextField?
    @IBOutlet weak var notification_server: UITextField?
    @IBOutlet weak var owner_field: UITextField?
    
    func udpateTextField(string: String) {
        device_uuid_field?.text = string
    }
    
    func device_token() -> String {
        let token = device_uuid_field!.text!
        return token
    }
    
    func owner() -> String {
        let user = device_uuid_field!.text!
        return user
    }
    
    @IBAction func register() {
        
        Agent.post(notification_server!.text!)
            .send([
                "push_token": device_token(),
                "project" : PROJECT,
                "name" : UIDevice.currentDevice().name,
                "model" : UIDevice.currentDevice().model,
                "system_name" : UIDevice.currentDevice().systemName,
                "system_version": UIDevice.currentDevice().systemVersion,
                "tags":["pushy","sandbox"],
                "owner" : owner()
            ])
            .end({ (response: NSHTTPURLResponse!, data: Agent.Data!, error: NSError!) -> Void in
                // react to the result of your request
                }
            )
    }
    
    @IBAction func deregister() {
        Agent.delete(notification_server!.text!)
            .send([ "push_token": device_token(), "project" : PROJECT ])
            .end({ (response: NSHTTPURLResponse!, data: Agent.Data!, error: NSError!) -> Void in
                // react to the result of your request
                }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        delegate.viewController = self
        
        notification_server?.text = "https://notification.dev/api/v1/devices"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

