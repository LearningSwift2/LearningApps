//
//  WinningTicketViewController.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class WinningTicketViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var picker: UIPickerView!
    var delegate: WinningTicketViewControllerDelegate?
    var winningPicks = [Int](count: 6, repeatedValue: 0)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIPickerView data source
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 6
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 53
    }
    
    // MARK: - UIPickerView delegate
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 20.0
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
        return 40.0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(row + 1)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        winningPicks[component] = row+1
    }
    
    // MARK: - Action Handlers
    
    @IBAction func checkTickets(sender: UIButton)
    {
        if winningPicks.count == 6
        {
            let winningTicket = Ticket(picksArray: winningPicks)
            delegate?.winningTicketWasAdded(winningTicket)
        }
    }
    
    @IBAction func cancelTapped(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
