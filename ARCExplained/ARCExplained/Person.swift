//
//  Person.swift
//  ARCExplained
//
//  Created by Phil Wright on 4/11/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import Foundation

class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}