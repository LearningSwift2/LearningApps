//
//  ViewController.swift
//  KingFisherTestApp
//
//  Created by Phil Wright on 1/12/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = NSURL(string: "https://s3.amazonaws.com/ridepost-dev/events/TheIronYard_logo.png") else {
                fatalError("Invalid URL")
        }
        
        let resource = Resource(downloadURL: url, cacheKey: "iron-yard-logo")
        
        imgView.kf_setImageWithResource(resource)
        
    }


}

