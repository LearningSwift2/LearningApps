//
//  ZoomScrollView.swift
//  SimpleZoomingScrollView
//
//  Created by Phil Wright on 2/17/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ZoomScrollView: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var image = UIImage()
    
    var isZooming: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func displayImage() {
        self.imageView.image = image
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        scrollView.pagingEnabled = false
        scrollView.delaysContentTouches = false
        
        //set offsets before insets
        self.setScrollOffsets()
        self.setScrollInsets()
    }
    
    func setScrollOffsets() {
        let screenSize = self.scrollView.frame.size
        var leftOffset = 0;
        var topOffset = 0;
        
        let navController = self.navigationController
    
        if navController != nil {
            if self.imageView?.image.size.height > (screenSize.height - navController.navigationBar.frame.size.height + 5) {
            topOffset = -(self.navigationController?.navigationBar.frame.size.height + OFFSET);
        }
    
        if(self.imageView.image.size.width > screenSize.width - OFFSET) {
            leftOffset = -1 * OFFSET;
        }
        self.scrollView.contentOffset = CGPointMake(leftOffset, topOffset);
        
    
    }

    
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        
    }
    

}
