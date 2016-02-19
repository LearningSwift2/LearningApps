//
//  ViewController.swift
//  SimpleYouTube
//
//  Created by Phil Wright on 12/17/15.
//  Copyright © 2015 Touchopia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var videoIDString = ""
        
        if let videoURL = NSURL(string: "https://www.youtube.com/watch?v=_LXiSPpfM54") {
            if let theID = videoIDFromYouTubeURL(videoURL) {
                videoIDString = theID
            }
        }
        
        print(videoIDString)
        
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as UITableViewCell
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        
    }


}

