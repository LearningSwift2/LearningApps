//
//  Sector.swift
//  RotaryWheelProject
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

struct Sector {
    var minValue : Float
    var maxValue : Float
    var midValue : Float
    var sector : Int
}

extension Sector: CustomStringConvertible {
    var description : String {
        return "\(sector) : \(minValue), \(maxValue), \(midValue)"
    }
}
