//
//  Song.swift
//  IronTunes
//
//  Created by Ben Gohlke on 9/14/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import Foundation
import AVFoundation

class Song
{
    let title: String
    let artist: String
    let filename: String
    let albumArtworkName: String
    
    let playerItem: AVPlayerItem
    
    init(title: String, artist: String, filename: String, albumArtwork: String)
    {
        self.title = title
        self.artist = artist
        self.filename = filename
        self.albumArtworkName = albumArtwork
        self.playerItem = AVPlayerItem(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(filename, ofType: "mp3")!))
    }
}