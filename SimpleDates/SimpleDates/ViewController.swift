//
//  ViewController.swift
//  SimpleDates
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var today = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // twitter api
        
        let twitter = today.toString(format: DateFormat.Custom("EEE, d LLL yyyy HH:mm:ss Z"))
        
        print(twitter)
        
        let google = today.toString(format: .Custom("yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"))
        
        print(google)
        
        let facebook = today.toString(format: DateFormat.Custom("yyyy-MM-dd'T'HH:mm:ssZZZZ"))
        
        
        print(facebook)
        
    }

}

