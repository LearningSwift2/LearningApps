//
//  ViewController.swift
//  SimpleBlockOperation
//
//  Created by Phil Wright on 4/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

/*  
 
 After the calculation who do we display the result?

 We have to do this inside the block operation because we don’t 
 know how long the task will take.
 
 Note: You must not change the UI outside the main thread or the App will crash.
 
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // First create a queue
        let queue = NSOperationQueue()
        
        // Create an operation (a time consuming one)
        
        let blockOperation = NSBlockOperation {
            
            var result = 0
            
            for i in 1...1000000000 {
                result += i
            }
            
            // Only update the UI on the main thread
            NSOperationQueue.mainQueue().addOperationWithBlock {
                self.spinner.stopAnimating()
                self.resultLabel.text = "\(result)"
                self.resultLabel.hidden = false
            }
        }
        
        queue.addOperation(blockOperation)
        
    }

}

