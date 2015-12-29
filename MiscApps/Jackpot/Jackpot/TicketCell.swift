//
//  TicketCell.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell
{

    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var payoutLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
