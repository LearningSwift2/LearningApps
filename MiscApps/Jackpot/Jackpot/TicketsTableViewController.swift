//
//  TicketsTableViewController.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol WinningTicketViewControllerDelegate
{
    func winningTicketWasAdded(ticket: Ticket)
}

class TicketsTableViewController: UITableViewController, WinningTicketViewControllerDelegate
{

    @IBOutlet weak var addButton: UIBarButtonItem!
    var tickets = [Ticket]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tickets.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TicketCell", forIndexPath: indexPath) as! TicketCell

        let aTicket = tickets[indexPath.row]
        cell.numbersLabel.text = aTicket.description()
        if aTicket.winner
        {
            cell.backgroundColor = UIColor.greenColor()
            cell.payoutLabel.text = aTicket.payout
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
            cell.payoutLabel.text = ""
        }

        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowWinningTicketSegue"
        {
            let winningTicketVC = segue.destinationViewController as! WinningTicketViewController
            winningTicketVC.delegate = self
        }
    }
    
    // MARK: - Winning ticket view controller delegate
    
    func winningTicketWasAdded(ticket: Ticket)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        checkForWinnersUsingTicket(ticket)
    }
    
    // MARK: - Action Handlers
    
    @IBAction func createTicket(sender: UIButton)
    {
        let aTicket = Ticket()
        tickets.append(aTicket)
        self.tableView.reloadData()
    }
    
    // MARK: - Private methods
    
    func checkForWinnersUsingTicket(winningTicket: Ticket)
    {
        for ticket in tickets
        {
            ticket.compareWithTicket(winningTicket)
        }
        tableView.reloadData()
    }

}
