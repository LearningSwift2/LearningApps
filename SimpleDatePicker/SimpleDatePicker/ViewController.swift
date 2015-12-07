//
//  ViewController.swift
//  SimpleDatePicker
//
//  Created by Phil Wright on 12/6/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var datePickerIsHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup datePicker

        // note: datePickerMode must be set before minuteInterval
        datePicker.datePickerMode = .Time
        datePicker.minuteInterval = 15

        // setup formatter
        dateFormatter.timeStyle = .ShortStyle
    }
    
    override func viewWillAppear(animated: Bool) {
        self.bottomConstraint.constant -= self.datePicker.frame.size.height
        datePickerIsHidden = true
        dateHasChanged()
    }

    @IBAction func chooseDate() {
        if datePickerIsHidden == true {
            showDatePicker()
        } else {
            hideDatePicker()
        }
        
    }
    
    @IBAction func dateHasChanged() {
        dateLabel.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    func showDatePicker() {
        
        if datePickerIsHidden == true {
            
            datePickerIsHidden = false
            
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
                self.bottomConstraint.constant += self.datePicker.frame.size.height
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }
    
    func hideDatePicker() {
        
        if datePickerIsHidden == false {
            datePickerIsHidden = true
            
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
                self.bottomConstraint.constant -= self.datePicker.frame.size.height
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }

}

