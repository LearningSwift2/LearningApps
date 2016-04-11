//
//  ViewController.swift
//  SignatureApp
//
//  Created by Phil Wright on 4/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signatureView: SignatureView!
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        UIImageWriteToSavedPhotosAlbum(self.signatureView.getSignatureImage(), nil, nil, nil)
    }

    @IBAction func clearButtonTapped(sender: UIButton) {
        
        self.signatureView.clearSignature()
    }
    
    
    


}

