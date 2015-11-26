//
//  ViewController.swift
//  TLPinchImageExample
//
//  Created by Phil Wright on 9/24/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView : UIImageView = UIImageView(image: UIImage(named: "funBackground"))
    let imageView : PinchZoomImageView = PinchZoomImageView(image: UIImage(named: "1"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .ScaleAspectFill
        view.addSubview(backgroundImageView)
        view.addSubview(imageView)
    }

}

