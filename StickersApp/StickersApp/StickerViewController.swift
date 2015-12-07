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
    
    let maxStickers = 2
    
    var backgroundImageView : UIImageView?
    var backgroundImage : UIImage?
    
    var stickersArray : Array<UIImageView> = [];
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start With the BlueBackground
        backgroundImage = UIImage(named: "blueBackground")
        
        updateBackgroundImage()
        
        view.bringSubviewToFront(toolbar)
    }
    
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)

        self.view.bringSubviewToFront(self.toolbar)
        updateBackgroundImage()
    }
    
    func updateBackgroundImage() {
        
        // is there a backgroundImageString available?
        
        backgroundImageView?.removeFromSuperview()
 
        backgroundImageView = UIImageView(image: backgroundImage)
        
        backgroundImageView?.frame = view.bounds
        backgroundImageView?.contentMode = .ScaleAspectFill
        view.insertSubview(backgroundImageView!, atIndex: 0)
    }
    
    @IBAction func chooseBackgroundImage() {
        
    }
    
   
    @IBAction func actionAddImage(sender: AnyObject) {
        
        // 1 choose random image between 1 and maximum stickers
        
        let randomNumber = RandomInt(min: 1, max: maxStickers)
        
        // 2 Use String Interpolation to get the image
        
        let imageView = PinchZoomImageView(image: UIImage(named: "\(randomNumber)"))
        
        // 3
        imageView.frame.origin = randomOriginPoint()
        
        // 3
        view.addSubview(imageView)
        
        // 4
        stickersArray.append(imageView)
        
        view.bringSubviewToFront(toolbar)
    }
    
    @IBAction func actionDeleteImage(sender: AnyObject) {

        // 1
        let stickersCount = stickersArray.count
        
        if(stickersCount > 0) {
            
            // 2
            if let imageView = stickersArray[0] as UIImageView? {
                imageView.removeFromSuperview()
                stickersArray.removeFirst()
            }
        }
        
    }
    
    // MARK: - Better Random Number Generator
    
    func RandomInt(min min: Int, max: Int) -> Int {
        
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
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
        
        let alertController = UIAlertController(title: "Image Saved", message:"Screen Saved to Photo Gallery", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func randomOriginPoint() -> CGPoint {
        
        let screenWidth = UInt32(self.view.frame.size.width / 3)
        return CGPointMake(CGFloat(arc4random_uniform(screenWidth)), CGFloat(arc4random_uniform(screenWidth)))
    }
    
}

