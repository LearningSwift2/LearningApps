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
    
    let leftIdentifier = "leftSide"
    let rightIdentifier = "rightSide"

    let velocity: CGFloat = 1.0
    
    var ball = UIView(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
    
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.ball.backgroundColor = UIColor.redColor()
        self.ball.layer.cornerRadius = 20
        self.view.addSubview(self.ball)
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        
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
        
        let collisionBehavior = UICollisionBehavior(items: [self.ball])
        collisionBehavior.collisionDelegate = self
        
        let frame = self.view.frame
        
        let leftFromPoint = CGPoint(x: 0, y: 0)
        let leftToPoint = CGPoint(x: 0, y: frame.size.height)
        
        collisionBehavior.addBoundaryWithIdentifier(leftIdentifier,
                                                    fromPoint:leftFromPoint,
                                                    toPoint: leftToPoint)

        let rightFromPoint = CGPoint(x: frame.size.width, y: 0)
        let rightToPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        
        
        collisionBehavior.addBoundaryWithIdentifier(rightIdentifier,
                                                    fromPoint:  rightFromPoint,
                                                    toPoint: rightToPoint)

        
        self.animator.addBehavior(collisionBehavior)
        
    }
  
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        
        if let identifier = identifier as? String {
            
            print(identifier)
            
            if identifier == leftIdentifier {
                pushRight()
            }
            
            if identifier == rightIdentifier {
                pushLeft()
            }
        }
    }
    
}

