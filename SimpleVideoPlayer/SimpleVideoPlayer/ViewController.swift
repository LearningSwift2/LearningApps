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
    
    var player : AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }

    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("GITGirlsProgram", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        self.player = AVPlayer(URL: url)
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        player?.play()
    }

}

