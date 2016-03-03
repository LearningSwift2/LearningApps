//
//  ViewController.swift
//  SimpleSwipeToDelete
//
//  Created by Phil Wright on 3/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var superheros = ["Superman", "Batman", "Spiderman", "Thor", "Wonder Woman",
        "Silver Surfer", "Iron Man", "Captain America", "The Flash"]
    
    var deleteHeroIndexPath: NSIndexPath?
    
    //MARK: - UITableViewDataSource Methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return superheros.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell")!
        
        cell.textLabel?.text = superheros[indexPath.row]
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            deleteHeroIndexPath = indexPath
            let heroToDelete = superheros[indexPath.row]
            confirmDelete(heroToDelete)
        }
    }
    
    // Delete Confirmation and Handling
    func confirmDelete(hero: String) {
        
        let alert = UIAlertController(title: "Delete Superhero", message: "Are you sure you want to permanently delete \(hero)?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeleteHero)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeleteHero)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support presentation in iPad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleDeleteHero(alertAction: UIAlertAction!) {
        
        if let indexPath = deleteHeroIndexPath {
            
            tableView.beginUpdates()
            superheros.removeAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:[indexPath]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deleteHeroIndexPath = nil
            
            tableView.endUpdates()
        }
    }
    
    func cancelDeleteHero(alertAction: UIAlertAction!) {
        
        deleteHeroIndexPath = nil
    }


}

