//
//  ViewController.swift
//  SimpleNetworkReachable
//
//  Created by Phil Wright on 4/12/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.isConnectedToNetwork() == false {
            print("not connected")
        } else {
            print("connected")
        }
        
        
    }

}

