//
//  DateTableViewCell.swift
//  ReminderApp
//
//  Created by Phil Wright on 4/8/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var currentDate = NSDate()
    
    var isDatePickerHidden = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(currentDate: NSDate) {
        
        datePicker.hidden = isDatePickerHidden
        datePicker.date = currentDate
        
        self.layoutIfNeeded()
    }
    
    func toggleDatePicker() {
        
        self.isDatePickerHidden = !self.isDatePickerHidden
        
        self.datePicker.hidden = self.isDatePickerHidden
        
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        
        self.currentDate = sender.date
        
        NSNotificationCenter.defaultCenter().postNotificationName("DateHasChanged", object: nil)
    }
    
    


}
