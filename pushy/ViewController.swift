//
//  ViewController.swift
//  pushy
//
//  Created by Mark Madsen on 2014-11-19.
//  Copyright (c) 2014 Mark Madsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var device_uuid_field: UITextField?
    @IBOutlet weak var notification_server: UITextField?
    
    func udpateTextField(string: String) {
        device_uuid_field?.text = string
    }
    
    @IBAction func register() {
        let server = notification_server?.text?

        println("Register!")
        Agent.post(server!)
            .send([ "Key": "Value" ])
            .end({ (response: NSHTTPURLResponse!, data: Agent.Data!, error: NSError!) -> Void in
                // react to the result of your request
                }
        )
    }
    
    @IBAction func deregister() {
        let server = notification_server?.text?
        println("De-register!")
        Agent.post(server!)
            .send([ "Key": "Value" ])
            .end({ (response: NSHTTPURLResponse!, data: Agent.Data!, error: NSError!) -> Void in
                // react to the result of your request
                }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notification_server?.text = "http://notify.dev/api/devices"
        
        let delegate = UIApplication.sharedApplication().delegate as AppDelegate
        delegate.setViewController(self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}