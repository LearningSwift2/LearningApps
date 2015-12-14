//
//  ViewController.swift
//  SimpleScrollView
//
//  Created by Phil Wright on 12/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toolbarView: UIView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var frameImgView: UIImageView!
    
    @IBOutlet weak var framesButtOutlet: UIButton!
    
    @IBOutlet weak var framesView: UIView!
    
    @IBOutlet weak var framesScrollView: UIScrollView!
    
    /* Frame Buttons */
    var frameTag = 0
    var frameButtons: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFramesMenu()
        showFramesView()
    }
    
    // MARK: - SETUP FRAMES MENU
    func setFramesMenu() {
        
        // Variables for setting the Filter Buttons and Labels
        var xCoord: CGFloat = 0
        let yCoord: CGFloat = 10
        let buttonWidth:CGFloat = 50
        let buttonHeight: CGFloat = 50
        let gapBetweenButtons: CGFloat = 5
        
        // Counter
        var framesCount = 0
        
        for framesCount = 0; framesCount < 9; ++framesCount {
            frameTag = framesCount
            let framesImageStr:String = "f\(frameTag)"
            
            // Create a Button for each Frame ==========
            frameButtons = UIButton(type: UIButtonType.Custom)
            frameButtons?.frame = CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)
            frameButtons?.tag = frameTag
            frameButtons?.showsTouchWhenHighlighted = true
            frameButtons?.setBackgroundImage(UIImage (named: framesImageStr), forState: UIControlState.Normal)
            frameButtons?.addTarget(self, action: "frameButtTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            
            // Add Buttons & Labels based on xCood
            xCoord +=  buttonWidth + gapBetweenButtons
            framesScrollView.addSubview(frameButtons!)
        }
        
        // Place Buttons into the Frames ScrollView =====
        framesScrollView.contentSize = CGSizeMake(buttonWidth * CGFloat(framesCount+1), yCoord)
        
        print(framesScrollView.contentSize)
    }
    
    
    func frameButtTapped(button: UIButton) {
        frameImgView.image = UIImage(named: "frame\(button.tag)")
    }


    func showFramesView() {
        framesButtOutlet.backgroundColor = UIColor(red: 201.0/255.0, green: 91.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.framesView.frame.origin.y = self.toolbarView.frame.origin.y - self.framesView.frame.size.height
            }, completion: { (finished: Bool) in
        })
    }
    func hideFramesView() {
        framesButtOutlet.backgroundColor = UIColor.clearColor()
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.framesView.frame.origin.y = self.view.frame.size.height
            }, completion: { (finished: Bool) in
        })
    }

}

