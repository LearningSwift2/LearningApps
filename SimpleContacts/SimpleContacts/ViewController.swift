//
//  ViewController.swift
//  SimpleContacts
//
//  Created by Phil Wright on 4/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentContactMatchingName(name: String) throws {
        let predicate = CNContact.predicateForContactsMatchingName(name)
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey]
        let store = CNContactStore()
        
        let contacts = try store.unifiedContactsMatchingPredicate(
            predicate,
            keysToFetch: keysToFetch
        )
        
        if let firstContact = contacts.first {
            let viewController = CNContactViewController(forContact: firstContact)
            viewController.contactStore = self.store
            
            presentViewController(viewController, animated: true, completion: nil)
        }
    }


}

