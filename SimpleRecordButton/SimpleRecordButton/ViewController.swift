//
//  ViewController.swift
//  RecordButton
//
//  Created by Phil Wright on 12/15/15.
//  Copyright © 2015 Touchopia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var recordButton : RecordButton!
    var progressTimer : NSTimer!
    var progress : CGFloat! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up recorder button
        recordButton = RecordButton(frame: CGRectMake(0,0,70,70))
        recordButton.center = self.view.center
        recordButton.progressColor = .redColor()
        recordButton.closeWhenFinished = false
        recordButton.addTarget(self, action: "record", forControlEvents: .TouchDown)
        recordButton.addTarget(self, action: "stop", forControlEvents: UIControlEvents.TouchUpInside)
        recordButton.center.x = self.view.center.x
        view.addSubview(recordButton)
    }
    
    func record() {
        self.progressTimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
    }
    
    func updateProgress() {
        
        let maxDuration = CGFloat(5) // Max duration of the recordButton
        
        progress = progress + (CGFloat(0.05) / maxDuration)
        
        recordButton.setProgress(progress)
        
        if progress >= 1 {
            progressTimer.invalidate()
        }
    }
    
    func stop() {
        self.progressTimer.invalidate()
    }
}
