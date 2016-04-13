//
//  ViewController.swift
//  SimpleMainApp
//
//  Created by Phil Wright on 4/11/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    let mailController = MFMailComposeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailController.setSubject("Subject")
        mailController.setMessageBody("This is the body", isHTML: false)
        
        self.presentViewController(mailController, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

