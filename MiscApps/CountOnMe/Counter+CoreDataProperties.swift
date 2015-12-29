//
//  Counter+CoreDataProperties.swift
//  CountOnMe
//
//  Created by Ben Gohlke on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Counter {

    @NSManaged var title: String?
    @NSManaged var count: Int16

}
