//
//  DetailViewController.swift
//  SimpleTableView
//
//  Created by Phil Wright on 1/1/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie : Movie?
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        if let movie = self.movie {
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
