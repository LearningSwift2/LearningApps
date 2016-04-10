//
//  ViewController.swift
//  SimpleBallFun
//
//  Created by Phil Wright on 4/9/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    let velocity: CGFloat = 1.0
    
    var ball = UIView(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
    
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.ball.backgroundColor = UIColor.redColor()
        self.ball.layer.cornerRadius = 20
        self.view.addSubview(self.ball)
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        
        //let gravity = UIGravityBehavior(items: [self.ball])
        //self.animator.addBehavior(gravity)
        
        addCollision()
        
        pushLeft()
    }
    
    func pushLeft() {
        let push = UIPushBehavior(items: [self.ball], mode: .Instantaneous)
        push.pushDirection = CGVector(dx: -1 * velocity, dy: 0)
        self.animator.addBehavior(push)
    }
    
    func pushRight() {
        let push = UIPushBehavior(items: [self.ball], mode: .Instantaneous)
        push.pushDirection = CGVector(dx: 1 * velocity, dy: 0)
        self.animator.addBehavior(push)
    }
    
    func addCollision() {
        
        let frame = self.view.frame
        
        let leftFromPoint = CGPoint(x: 0, y: 0)
        let leftToPoint = CGPoint(x: 0, y: frame.size.height)
        
        let rightFromPoint = CGPoint(x: frame.size.width, y: 0)
        let rightToPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        
        
        let collisionBehavior = UICollisionBehavior(items: [self.ball])
        
        collisionBehavior.collisionDelegate = self
        
        collisionBehavior.addBoundaryWithIdentifier("left",
                                                    fromPoint:leftFromPoint,
                                                    toPoint: leftToPoint)
        
        collisionBehavior.addBoundaryWithIdentifier("right",
                                                    fromPoint:  rightFromPoint,
                                                    toPoint: rightToPoint)

        
        self.animator.addBehavior(collisionBehavior)
        
    }
  
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        
        if let idString = identifier as? String {
            
            print(idString)
            
            if idString == "left" {
                pushRight()
            }
            
            if idString == "right" {
                pushLeft()
            }
        }
    }
    
    func addBoundaryView(fromPoint: CGPoint, toPoint: CGPoint, color: UIColor) {
        
        //let theView = UIView(frame: CGRect(origin: <#T##CGPoint#>, size: <#T##CGSize#>)
        
        self.view.addSubview(theView)
    }
    

}

