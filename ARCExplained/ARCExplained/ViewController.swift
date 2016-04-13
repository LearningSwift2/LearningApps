//
//  ViewController.swift
//  ARCExplained
//
//  Created by Phil Wright on 4/11/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        reference1 = Person(name: "Phil Wright")
        reference2 = reference1
        reference3 = reference1
        
        // Note the above creates three STRONG references to our one Person instance.
        
        // Each time you deallocate a reference the count goes down by one.
    
        

    }

}

