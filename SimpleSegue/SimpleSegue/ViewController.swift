//
//  ColorViewController.swift
//  SimpleSegue
//
//  Created by Phil Wright on 3/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func redButtonTapped(sender: AnyObject) {
        label.text = "Red"
        performSegueWithIdentifier("ShowColor", sender: UIColor.redColor())
    }
    
    @IBAction func greenButtonTapped(sender: AnyObject) {
        label.text = "Green"
        performSegueWithIdentifier("ShowColor", sender: UIColor.greenColor())
    }
    
    @IBAction func blueButtonTapped(sender: AnyObject) {
        label.text = "Blue"
        performSegueWithIdentifier("ShowColor", sender: UIColor.blueColor())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowColor" {
            if let destinationController = segue.destinationViewController as? ColorViewController {
                destinationController.color = sender as? UIColor
            }
        }
    }


}

