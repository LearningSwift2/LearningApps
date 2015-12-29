//
//  ViewController.swift
//  Countdown
//
//  Created by Ben Gohlke on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol TimerPickerDelegate
{
    func timerWasChosen(timerCount: Int)
}

class CountdownViewController: UIViewController, TimerPickerDelegate
{

    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    var timer: NSTimer?
    
    var paused = true
    var originalCount = 60
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowCountdownPickerSegue"
        {
            let timerPickerVC = segue.destinationViewController as! TimerPickerViewController
            timerPickerVC.delegate = self
        }
    }
    
    // MARK: - TimerPicker Delegate
    
    func timerWasChosen(timerCount: Int)
    {
        originalCount = timerCount
        countLabel.text = "\(timerCount)"
    }
    
    // MARK: - Action Handlers
    
    @IBAction func startStopTapped(sender: UIButton)
    {
        startTimer()
    }
    
    @IBAction func resetTapped(sender: UIButton)
    {
        view.backgroundColor = UIColor.whiteColor()
        stopTimer()
        countLabel.text = "\(originalCount)"
        startStopButton.setTitle("Start", forState: UIControlState.Normal)
    }
    
    // MARK: Private
    
    private func startTimer()
    {
        if timer == nil
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateUI", userInfo: nil, repeats: true)
            startStopButton.setTitle("Pause", forState: UIControlState.Normal)
        }
        else
        {
            stopTimer()
            startStopButton.setTitle("Start", forState: UIControlState.Normal)
        }
    }
    
    private func stopTimer()
    {
        timer?.invalidate()
        timer = nil
    }
    
    func updateUI()
    {
        let newCount = Int(countLabel.text!)! - 1
        countLabel.text = String(newCount)
        if newCount == 0
        {
            view.backgroundColor = UIColor.redColor()
            stopTimer()
        }
        
    }
}