//
//  ViewController.swift
//  NotifyMe
//
//  Created by Ben Gohlke on 12/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

let popViewNotification = "PopViewNotification"

class MainViewController: UIViewController
{

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserverForName(popViewNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            self.navigationController?.popToRootViewControllerAnimated(true)
            self.label.text = notification.object as? String
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setLocalNotificationTapped(sender: UIButton)
    {
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeInterval: 10, sinceDate: NSDate())
        print(NSDate())
        print(localNotification.fireDate)
        localNotification.timeZone = NSTimeZone.localTimeZone()
        localNotification.alertBody = "Expecto Patronum!"
        localNotification.alertAction = "Open App"
        localNotification.soundName = UILocalNotificationDefaultSoundName
        
        let uuid = NSUUID()
        let userInfo = ["objectUUID": uuid.UUIDString]
        localNotification.userInfo = userInfo
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

    
    
    
    
    
    
    
    
    

}

