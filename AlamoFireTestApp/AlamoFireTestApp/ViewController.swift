//
//  ViewController.swift
//  AlamoFireTestApp
//
//  Created by Phil Wright on 12/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, "https://httpbin.org/image/png")
            .responseImage { response in
                debugPrint(response)
                
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
                if let image = response.result.value {
                    
                    self.imgView.image = image
                    print("image downloaded: \(image)")
                }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

