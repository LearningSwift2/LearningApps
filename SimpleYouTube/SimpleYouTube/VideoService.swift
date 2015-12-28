//
//  VideoModel.swift
//  SimpleYouTube
//
//  Created by Phil Wright on 12/17/15.
//  Copyright © 2015 Touchopia. All rights reserved.
//

import UIKit

class VideoService: NSObject {
    
    func getVideos() -> [Video] {
    
        var videos = [Video]()
        
        let video = Video(videoId: "CuM678WXs0c", title: "How to Change Your Frequency", description: "When you change your personal energy frequency you literally start to change your life. In her training on Consciousness Engineering program Christie Marie Sheldon teaches how to remove false childhood beliefs")
        
        videos.append(video)
        
        return videos
    }

}
