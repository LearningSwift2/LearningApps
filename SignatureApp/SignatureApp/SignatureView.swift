//
//  SignatureView.swift
//  SignatureApp
//
//  Created by Phil Wright on 4/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class SignatureView: UIView {
    
    let defaultLineWidth:CGFloat = 7.0

    let defaultColor:UIColor = UIColor.redColor()
    
    let beizerPath = UIBezierPath()
    
    var signatureImage: UIImage?
    
    var pointsArray = [CGPoint]()
    
    var control: Int = 0
    
    override func drawRect(rect: CGRect) {
        
        self.signatureImage?.drawInRect(rect)
        self.beizerPath.stroke()
        
        // Set initial color for drawing
        defaultColor.setFill()
        defaultColor.setStroke()
        self.beizerPath.lineWidth = self.defaultLineWidth
        self.beizerPath.stroke()
    }
    
    //MARK: Touches Methods
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.control = 0
        
        if let touch = touches.first {
            self.pointsArray.insert(touch.locationInView(self), atIndex: 0)
            let startPoint = self.pointsArray[0]
            let endPoint = CGPoint(x: startPoint.x + 1.5, y: startPoint.y)
            beizerPath.moveToPoint(startPoint)
            beizerPath.addLineToPoint(endPoint)
        }
        
        print("started drawing")
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        if let touchPoint = touch?.locationInView(self) {
            self.control = self.control + 1
            self.pointsArray.insert(touchPoint, atIndex: self.control)
        
            if (self.control == 4) {
                
                pointsArray[3] = CGPoint(x: (pointsArray[2].x + pointsArray[4].x)/2.0, y: (pointsArray[2].y + pointsArray[4].y)/2.0)
            
                beizerPath.moveToPoint(pointsArray[0])
                
                beizerPath.addCurveToPoint(pointsArray[3], controlPoint1: pointsArray[1], controlPoint2: pointsArray[2])
                self.setNeedsDisplay()
            
                pointsArray[0] = pointsArray[3]
                pointsArray[1] = pointsArray[4]
                
                self.control = 1
                
                print("moved")
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.drawBitmapImage()
        
        self.setNeedsDisplay()
        
        //beizerPath.removeAllPoints()
        
        self.control = 0
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let touches = touches {
            self.touchesEnded(touches, withEvent: event)
        }
    }
    
    func drawBitmapImage() {
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        
        if let image = self.signatureImage {
            
            let rectpath = UIBezierPath(rect: self.bounds)
            
            self.backgroundColor?.setFill()
            rectpath.fill()
            image.drawAtPoint(CGPointZero)
        
            //Set final color for drawing
            defaultColor.setStroke()
            beizerPath.stroke()
            self.signatureImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }
    
    func getSignatureImage() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        
        let signatureImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return signatureImage
    }
    
    func clearSignature() {
        
        self.signatureImage = nil
        
        self.beizerPath.removeAllPoints()
        
        self.setNeedsDisplay()
    }

}
