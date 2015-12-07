//
//  StickerViewController.swift
//  StickersApp
//
//  Created by Phil Wright on 9/1/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class StickerViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Choose Background Image
        backgroundImageView.image = UIImage(named: "orangeBackground")
    }

    
    @IBAction func actionAddImage(sender: AnyObject) {
        
        // Create a new Image
        let imageView = PinchZoomImageView(image: UIImage(named: "1"))
        
        // Create Random Origin Point
        let pointX = CGFloat(arc4random_uniform(UInt32(self.view.frame.size.width / 2)))
        
        var frame = imageView.frame
        frame.origin.x = pointX
        imageView.frame = frame
        
        // Add to the subview
        view.addSubview(imageView)
        
        // Ensure Toolbar is on top
        view.bringSubviewToFront(toolbar)
    }
    
    // MARK: - Save to Photo Gallery
    
    @IBAction func saveToPhotoGallery(sender: AnyObject) {
        
        // Hide the toolbar first!
        toolbar.hidden = true
        
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        toolbar.hidden = false
        
        // Show alert
        let alertController = UIAlertController(title: "Image Saved", message:"Screen Saved to Photo Gallery", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

