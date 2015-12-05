//
//  ViewController.swift
//  SimpleVideoPlayer
//
//  Created by Phil Wright on 12/1/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?) {
            
            if segue.identifier == "MoviePlayer" {
                    let destination = segue.destinationViewController as! AVPlayerViewController
            
                if let path = NSBundle.mainBundle().pathForResource("GITGirlsProgram", ofType:"mp4") {
                    let url = NSURL(fileURLWithPath: path)
                    destination.player = AVPlayer(URL: url)
                }
            }
    }
}

