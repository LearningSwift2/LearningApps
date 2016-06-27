//
//  ViewController.swift
//  SimpleAlertController
//
//  Created by Phil Wright on 6/27/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func addName() {
        
        // Create an instance of the UIAlertController class - style .Alert

        let alert = UIAlertController(title: "Add Name", message: "Add a new name", preferredStyle: .Alert)
        
        // Create an action called "Save"
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: {
            (action) in
            
            if let textField = alert.textFields?.first {
                
                if let name = textField.text {
                    print(name)
                }
            }
        })
        
        // Add the action to the alert instance
        alert.addAction(saveAction)
        
        // Create an action called Cancel
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) {
                                            (action) in
        }
        
        // Add the cancel action
        alert.addAction(cancelAction)
        
        
        // Add a textfield to the AlertController
        
        alert.addTextFieldWithConfigurationHandler {
            (textField) in
            
            // configure the placeholder text
            textField.placeholder = "Please enter your name"
        }
        
        // Present the alert using presentViewController
        self.presentViewController(alert, animated: true, completion: nil)
    }
    


}

