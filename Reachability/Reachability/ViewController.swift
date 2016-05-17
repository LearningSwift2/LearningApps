//
//  ViewController.swift
//  Reachability
//
//  Created by Phil Wright on 5/17/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if Reachability.isConnectedToNetwork() == false {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
        }
    }
}

