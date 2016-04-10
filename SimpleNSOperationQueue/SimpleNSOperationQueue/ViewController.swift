//
//  ViewController.swift
//  SimpleNSOperationQueue
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let operationQueue = NSOperationQueue()
    var cancelled = false

    @IBOutlet weak var operationCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Set maxConcurrent
        
        operationQueue.maxConcurrentOperationCount = 1
        
        addOperationToQueue()
        addOperationToQueue()
        addOperationToQueue()
        
        operationQueue.suspended = false
        
    }

    
    func addOperationToQueue() {
        let operation = NSBlockOperation { 
            
            print("Block is executing")
        
            for i in (1...5).reverse() {
                if self.cancelled {
                    return
                }
                
                print("Sleeping \(i)...")
                sleep(1)
            }
            
        }
        
        operationQueue.suspended = true // set to false to start
        
        operationQueue.addOperation(operation)
        
        
        
        
    }
    
    @IBAction func buttonTapped() {
        
    }

}

