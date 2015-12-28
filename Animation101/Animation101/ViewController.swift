//
//  ViewController.swift
//  Animation101
//
//  Created by Phil Wright on 12/21/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var theButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theButton.layer.cornerRadius = 10
        theButton.layer.masksToBounds = true
        
    }
    
    


}

