//
//  NowPlayingViewController.swift
//  SimpleMP3Player
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class NowPlayingViewController: UIViewController {
    
    var mp3Player:MP3Player?
    var timer:NSTimer?
    
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songTime: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var imageView : UIImageView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add listenser
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"setSongName", name:"SetSongName", object:nil)
        
        mp3Player = MP3Player()
        updateUI()
        setSongName()
    }
    
    // MARK: - Action Methods
    
    @IBAction func playPauseSong() {
        
        if let player = mp3Player {
            
            if player.isPlaying {
                pauseSong()
            } else {
                playSong()
            }
            startTimer()
        }
    }
    
    func playSong() {
        if let player = mp3Player {
            player.play()
            playPauseButton.setImage(UIImage(named: "icon-play"), forState: .Normal)
            updateUI()
            timer?.invalidate()
        }
    }
    
    func stopSong() {
        
        if let player = mp3Player {
            player.stop()
            playPauseButton.setImage(UIImage(named: "icon-stop"), forState: .Normal)
            updateUI()
            timer?.invalidate()
        }
    }
    
    func pauseSong() {
        
        if let player = mp3Player {
            player.pause()
            playPauseButton.setImage(UIImage(named: "icon-pause"), forState: .Normal)
        }
    }
    
    @IBAction func playNextSong(sender: UIButton) {
        mp3Player?.nextSong(false)
        startTimer()
    }
    
    @IBAction func setVolume(sender: UISlider) {
        mp3Player?.setVolume(sender.value)
    }
    
    @IBAction func playPreviousSong(sender: UIButton) {
        mp3Player?.previousSong()
        startTimer()
    }
    
    func setSongName() {
        songName.text = mp3Player?.getCurrentTitle()
    }
    
    func startTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateUI"), userInfo: nil, repeats: true)
    }
    
    func updateUI() {
        
        if let player = mp3Player {
        
            if let imageString = player.getCurrentImageAsString() {
                let image = UIImage(named: imageString)
                imageView.image = image
            }
            
            songTime.text = mp3Player?.getCurrentTimeAsString()
        
            if let progress = mp3Player?.getProgress() {
                progressBar.progress = progress
            }
        }
    }
}

