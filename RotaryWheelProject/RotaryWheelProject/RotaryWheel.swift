//
//  RotaryWheel.swift
//  RotaryWheelProject
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit
import Darwin
import QuartzCore

/*
    RotaryProtocol for wheelDidChange event
*/

protocol RotaryProtocol {
    func wheelDidChange(newValue: String)
}

// MARK: - RotaryWheel Control

class RotaryWheel: UIControl {
    
    var sectors = [Sector]()
    var numberOfSections : Int = 0
    var container: UIView = UIView()
    var startTransform : CGAffineTransform = CGAffineTransformIdentity
    var deltaAngle : CGFloat = 0
    var currentSector : Int = 0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, numberOfSections: Int) {
        super.init(frame: frame)
        self.numberOfSections = numberOfSections
        
        if self.numberOfSections % 2 == 0 {
            self.buildSectorsEven()
        } else {
            self.buildSectorsOdd()
        }
        
        drawWheel()
    }
    
    func buildSectorsEven() {
        let fanWidth : Float = Float(2 * M_PI) / Float(numberOfSections)
        var mid : Float = 0
        
        for i in 0..<numberOfSections {
            let midValue : Float = mid
            let minValue : Float = mid - (fanWidth/2)
            let maxValue : Float = mid + (fanWidth/2)
            
            let sector = Sector(minValue: minValue, maxValue: maxValue, midValue: midValue, sector: i)
            
            mid -= fanWidth
            
            if sector.midValue < Float(-M_PI) {
                mid = -mid
                mid -= fanWidth
            }
            
            sectors.append(sector)
            print("cl is \(sector)")
        }
    }
    
    func buildSectorsOdd() {
        let fanWidth : Float = Float(2 * M_PI) / Float(numberOfSections)
        var mid : Float = 0
        
        for i in 0..<numberOfSections {
            let midValue : Float = mid
            let minValue : Float = mid - (fanWidth/2)
            let maxValue : Float = mid + (fanWidth/2)
            
            var sector = Sector(minValue: minValue, maxValue: maxValue, midValue: midValue, sector: i)
            
            if sector.maxValue - fanWidth < Float(-M_PI) {
                mid = Float(M_PI)
                sector.midValue = mid
                sector.minValue = fabs(sector.maxValue)
            }
            
            mid -= fanWidth
            sectors.append(sector)
            print("cl is \(sector)")
        }
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let touchPoint = touch.locationInView(self)
        
        let dx = touchPoint.x - container.center.x
        let dy = touchPoint.y - container.center.y
        
        let diff = self.calculateDistanceFromCenter(touchPoint)
        
        if diff < 40 || diff > 100 {
            print("ignoring tap")
            return false
        }
        
        deltaAngle = atan2(dy,dx)
        
        startTransform = container.transform
        
        return true
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        
        let radians = atan2(container.transform.b, container.transform.a)
        print("Rad is \(radians)")
        
        let pt = touch.locationInView(self)
        
        let dx = pt.x - container.center.x
        let dy = pt.y - container.center.y
        
        let diff = self.calculateDistanceFromCenter(pt)
        
        if diff < 40 || diff > 100 {
            print("ignoring tap")
            return false
        }
        
        let angle = atan2(dy,dx)
        let angleDifference = deltaAngle - angle
        container.transform = CGAffineTransformRotate(startTransform, -angleDifference)
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        let radians = atan2(container.transform.b, container.transform.a)
        var newVal : CGFloat = 0.0
        
        for s in sectors {
            if radians > CGFloat(s.minValue) && radians < CGFloat(s.maxValue) {
                newVal = radians - CGFloat(s.midValue)
                currentSector = s.sector
                break
            }
            
            if s.minValue > 0 && s.maxValue < 0 {
                if CGFloat(s.minValue) > radians || CGFloat(s.minValue) < radians {
                    if radians > 0 {
                        newVal = radians - CGFloat(M_PI)
                    } else {
                        newVal = CGFloat(M_PI) + radians
                    }
                    currentSector = s.sector
                }
            } else if radians > CGFloat(s.minValue) && radians < CGFloat(s.maxValue) {
                newVal = radians - CGFloat(s.midValue)
                currentSector = s.sector
            }
        }
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.2)
        let t = CGAffineTransformRotate(container.transform, -newVal)
        container.transform = t
        UIView.commitAnimations()
    }
    
    func calculateDistanceFromCenter(point: CGPoint) -> Double {
        let center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        let dx = point.x - center.x
        let dy = point.y - center.y

        return sqrt(Double(dx*dx+dy*dy))
    }
    
    func rotate() {
        let t = CGAffineTransformRotate(container.transform, -0.78)
        container.transform = t
    }
    
    func drawWheel() {
        container = UIView(frame: self.frame)
        
        let angleSize = CGFloat(2*M_PI) / CGFloat(numberOfSections)
        
        for i in 0..<numberOfSections {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
            label.backgroundColor = UIColor.redColor()
            label.text = String(format: "%i", i)
            label.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
            label.layer.position = CGPoint(x: container.frame.size.width/2.0, y:container.frame.size.height/2.0)
            label.transform = CGAffineTransformMakeRotation(angleSize * CGFloat(i))
            label.tag = i
            
            container.addSubview(label)
        }
        container.userInteractionEnabled = false
        self.addSubview(container)
    }
    

}
