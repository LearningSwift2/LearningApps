//
//  ColorViewController.swift
//  SimpleSegue
//
//  Created by Phil Wright on 3/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color
    }
    
    
}
