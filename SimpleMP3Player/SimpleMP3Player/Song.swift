//
//  Music.swift
//  SimpleMP3Player
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class Song {
    
    let title: String
    let artist: String
    let filename : String
    let fileURL: NSURL?
    let albumArtworkName: String
    
    init(title: String, artist: String, filename: String, albumArtwork: String) {
        self.title = title
        self.artist = artist
        self.albumArtworkName = albumArtwork
        self.filename = filename

        if let urlString = NSBundle.mainBundle().pathForResource(filename, ofType: "mp3") {
            self.fileURL = NSURL(string: urlString)
        } else {
            self.fileURL = nil
        }
    }
}