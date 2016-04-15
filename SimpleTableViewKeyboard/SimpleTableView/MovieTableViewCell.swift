//
//  MovieTableViewCell.swift
//  SimpleTableView
//
//  Created by Phil Wright on 4/15/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(text: String, viewController: MovieTableViewController) {
        self.movieLabel.text = text
        self.textField.delegate = viewController
    }

}
