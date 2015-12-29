//
//  ViewController.swift
//  SayMyName
//
//  Created by Ben Gohlke on 10/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var changeColorSwitch: UISwitch!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.text = ""
        messageLabel.text = ""
        changeColorSwitch.on = false
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers

    @IBAction func switchValueChanged(sender: UISwitch)
    {
        if sender.on
        {
            view.backgroundColor = UIColor.greenColor()
        }
        else
        {
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func buttonTapped(sender: UIButton)
    {
        sayHello()
    }
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return sayHello()
    }
    
    // MARK: - Private
    
    func sayHello() -> Bool
    {
        var rc = false
        
        if let name = nameTextField.text
        {
            rc = true
            nameTextField.resignFirstResponder()
            let nameComponents = name.characters.split(" ").map { String($0) }
            messageLabel.text = "Hello, \(nameComponents[0])"
        }
        
        return rc
    }
}

