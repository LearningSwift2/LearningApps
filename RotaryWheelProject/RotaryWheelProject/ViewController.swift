//
//  ViewController.swift
//  RotaryWheelProject
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sectorLabel : UILabel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectorLabel = UILabel(frame: CGRect(x: 100, y: 350, width: 120, height: 30))
        sectorLabel?.textAlignment = .Center
        view.addSubview(sectorLabel!)
        

        let wheel = RotaryWheel(frame: CGRect(x: 0, y: 0, width: 200, height: 200), numberOfSections: 8)
        
        wheel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(wheel)
    }

    


}

