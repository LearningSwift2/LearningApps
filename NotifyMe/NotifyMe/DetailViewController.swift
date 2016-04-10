//
//  DetailViewController.swift
//  NotifyMe
//
//  Created by Ben Gohlke on 12/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postNotificationTapped(sender: UIButton)
    {
        NSNotificationCenter.defaultCenter().postNotificationName(popViewNotification, object: "Popped from Detail View")
    }
    
    
    
    
    
    
    
    
}
