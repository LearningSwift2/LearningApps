//
//  ReminderTableViewCell.swift
//  SimpleReminders
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var reminderImageView: UIImageView!
    @IBOutlet weak var reminderLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(text: String) {
        self.reminderLabel.font = ThemeManager.sharedInstance.defaultFont()
        self.reminderLabel.text = text
        
        self.layoutIfNeeded()
    }

}
