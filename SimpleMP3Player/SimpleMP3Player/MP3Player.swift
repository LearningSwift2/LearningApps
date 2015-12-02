//
//  MP3Player.swift
//  SimpleMP3Player
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class MP3Player: NSObject, AVAudioPlayerDelegate {
    
    var player:AVAudioPlayer?
    var currentIndex = 0
    var currentSong: Song?
    var songs = [Song]()
    var isPlaying = false
    
    override init() {
        super.init()
        configurePlaylist()
        queueSong();
    }
    
    func configurePlaylist() {
        
        songs = [Song]()
        
        let acoustic = Song(title: "Happiness", artist: "Benjamin Tissot", filename: "happiness", albumArtwork: "Acoustic")
        songs.append(acoustic)
        
        currentSong = acoustic
        
        let dubstep = Song(title: "Dubstep", artist: "Benjamin Tissot", filename: "dubstep", albumArtwork: "Dubstep")
        songs.append(dubstep)
        
        let hiphop = Song(title: "Groovy Hip Hop", artist: "Benjamin Tissot", filename: "groovyhiphop", albumArtwork: "HipHop")
        songs.append(hiphop)
        
        let rock = Song(title: "Actionable", artist: "Benjamin Tissot", filename: "actionable", albumArtwork: "Rock")
        songs.append(rock)
        
        let funk = Song(title: "Funky Suspense", artist: "Benjamin Tissot", filename: "funkysuspense", albumArtwork: "Funk")
        songs.append(funk)
    }
    
    func queueSong() {
        
        player = nil
        
        currentSong = songs[currentIndex]
        
        if let url = currentSong?.fileURL {
            
            do {
                player = try AVAudioPlayer(contentsOfURL: url)
                player?.delegate = self
                player?.prepareToPlay()
                NSNotificationCenter.defaultCenter().postNotificationName("SetSongName", object: nil)
            } catch let error as NSError {
                print("Audio Error: \(error.localizedDescription)")
                player = nil
            }
        }
    }
    
    func play() {
        
        if player?.playing == false {
            player?.play()
            isPlaying = true
        }
    }
    
    func stop() {
        
        if player?.playing == true {
            player?.stop()
            player?.currentTime = 0
            isPlaying = false
        }
    }
    
    func pause() {
        
        if player?.playing == true {
            player?.pause()
            isPlaying = false
        }
    }
    
    func nextSong(songFinishedPlaying:Bool) {
        
        var playerWasPlaying = false
        
        if player?.playing == true {
            stop()
            playerWasPlaying = true
        }
        
        currentIndex++
        
        if currentIndex >= songs.count {
            currentIndex = 0
            currentSong = songs[currentIndex]
        }
        
        queueSong()
        
        if playerWasPlaying || songFinishedPlaying { play() }
    }
    
    func previousSong() {
        
        var playerWasPlaying = false
        
        if player?.playing == true {
            stop()
            playerWasPlaying = true
        }
        
        currentIndex--
        
        if currentIndex < 0 {
            currentIndex = songs.count - 1
        }
        
        queueSong()
        
        if playerWasPlaying {
            play()
        }
    }
    
    func getCurrentTitle() -> String {
        return songs[currentIndex].title
    }
    
    func getCurrentTimeAsString() -> String {
        var seconds = 0
        var minutes = 0
        
        if let time = player?.currentTime {
            seconds = Int(time) % 60
            minutes = (Int(time) / 60) % 60
        }
        return String(format: "%0.2d:%0.2d",minutes,seconds)
    }
    
    func getCurrentImageAsString() -> String? {
        return currentSong?.albumArtworkName
    }
    
    //MARK: Progress
    
    func getProgress() -> Float {

        var currentTime = 0.0
        var currentDuration = 0.0
        
        if let time = player?.currentTime, duration = player?.duration {
            currentTime = time
            currentDuration = duration
        }
        
        return Float(currentTime / currentDuration)
    }
    
    //MARK: Volume
    
    func setVolume(volume:Float) {
        player?.volume = volume
    }
    
    //MARK: - Delegate Methods
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if flag == true {
            nextSong(true)
        }
    }
}
