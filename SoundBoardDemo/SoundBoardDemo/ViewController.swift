//
//  ViewController.swift
//  SoundBoardDemo
//
//  Created by Phil Wright on 1/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    let soundFilenames = ["chewy_roar", "disturbence", "R2D2-do", "swvader02"]
    
    var audioplayers = [AVAudioPlayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in soundFilenames {
            let audioplayer = audioplayerFromFilename(sound)
            if let player = audioplayer {
                audioplayers.append(player)
            }
        }
    }
    
    
    @IBAction func playSound(sender: UIButton) {

        let player = audioplayers[sender.tag]
        player.play()
    }
    
    /*
        This function will create a new Audio Player instance and load the wav file into the player for us
    */
    
    func audioplayerFromFilename(filename : String) -> AVAudioPlayer? {
        
        var audioplayer : AVAudioPlayer?
        
        let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: "wav")
        
        if let filePath = filePath {
            do {
                audioplayer = try AVAudioPlayer(contentsOfURL: filePath)
                audioplayer?.volume = 1
                audioplayer?.prepareToPlay()
            } catch {
                print("Something Went Wrong")
            }
        } else {
            print("The FilePath is Empty")
        }
        return audioplayer
    }

    

}

