//
//  ViewController.swift
//  SimpleRealm
//
//  Created by Phil Wright on 3/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let luke = Person()
        luke.name = "Luke Skywalker"
        luke.createdAt = NSDate()
        
        let starship = Starship()
        starship.name = "X-wing"
        starship.createdAt = NSDate()
        
        let starship2 = Starship()
        starship2.name = "Millennium Falcon"
        starship2.createdAt = NSDate()
        
        
        luke.starships.append(starship)
        luke.starships.append(starship2)
        
        
        
        do {
            try realm.write() { () -> Void in
                realm.add(luke)
            }
        } catch {
            print("An error occurred writing luke")
        }
        
        
        let persons = realm.objects(Person)
        
        for p in persons {
            print(p.name)
            print(p.createdAt)
            
            for s in p.starships {
                print(s.name)
                print(s.createdAt)
            }
        }
        
    }



}

