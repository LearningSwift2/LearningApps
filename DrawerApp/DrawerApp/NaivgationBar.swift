//
//  NaivgationBar.swift
//  DrawerApp
//
//  Created by Phil Wright on 1/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    class func gradientLayerForBounds(bounds: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [UIColor.redColor().CGColor, UIColor.blueColor().CGColor]
        return layer
    }
}
