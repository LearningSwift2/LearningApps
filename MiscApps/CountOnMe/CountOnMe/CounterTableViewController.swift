//
//  CounterTableViewController.swift
//  CountOnMe
//
//  Created by Ben Gohlke on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class CounterTableViewController: UITableViewController, UITextFieldDelegate
{
    // Retrieve the managed object context from the AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var counters = Array<Counter>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Counters"
        
        navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let fetchRequest = NSFetchRequest(entityName: "Counter")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        do {
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Counter]
            counters = fetchResults!
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return counters.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CounterCell", forIndexPath: indexPath) as! CounterCell

        // Configure the cell...
        let aCounter = counters[indexPath.row]
        
        if aCounter.title == nil
        {
            cell.counterTitleTextField.becomeFirstResponder()
        }
        else
        {
            cell.counterTitleTextField.text = aCounter.title
        }
        cell.countLabel.text = "\(aCounter.count)"

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            let aCounter = counters[indexPath.row]
            counters.removeAtIndex(indexPath.row)
            managedObjectContext.deleteObject(aCounter)
            saveContext()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField.text != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! CounterCell
            let indexPath = tableView.indexPathForCell(cell)
            let aCounter = counters[indexPath!.row]
            aCounter.title = textField.text
            textField.resignFirstResponder()
            saveContext()
        }
        
        return rc
    }
    
    // MARK: - Action Handlers
    
    @IBAction func stepperValueChanged(sender: UIStepper)
    {
        let contentView = sender.superview
        let cell = contentView?.superview as! CounterCell
        let indexPath = tableView.indexPathForCell(cell)
        let aCounter = counters[indexPath!.row]
        let countAsInt = Int16(sender.value)
        aCounter.count = countAsInt
        cell.countLabel.text = "\(countAsInt)"
        saveContext()
    }
    
    @IBAction func addCounter(sender: UIBarButtonItem)
    {
        let newCounter = NSEntityDescription.insertNewObjectForEntityForName("Counter", inManagedObjectContext: managedObjectContext) as! Counter
        
        counters.append(newCounter)
        tableView.reloadData()
    }
    
    // MARK: - Private
    
    func saveContext()
    {
        do {
            try managedObjectContext.save()
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
}