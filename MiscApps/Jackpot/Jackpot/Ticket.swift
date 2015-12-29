//
//  Ticket.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Ticket
{
    var winner: Bool
    var payout: String
    private var picks = Set<Int>()
    
    init()
    {
        winner = false
        payout = ""
        for _ in 0..<6
        {
            createPick()
        }
    }
    
    init(picksArray: Array<Int>)
    {
        winner = false
        payout = ""
        for i in 0..<picksArray.count
        {
            picks.insert(picksArray[i])
        }
    }
    
    func createPick()
    {
        var pickFound = false
        repeat
        {
            let aPick = Int(arc4random() % 53 + 1)
            if !picks.contains(aPick)
            {
                picks.insert(aPick)
                pickFound = true
            }
        } while !pickFound
    }
    
    func description() -> String
    {
        var numbers = ""
        for pick in picks.sort()
        {
            numbers = numbers + " \(pick)"
        }
        return numbers
    }
    
    func picksArray() -> [Int]
    {
        var picksArray = [Int]()
        
        for pick in picks.sort()
        {
            picksArray.append(pick)
        }
        return picksArray
    }
    
    func compareWithTicket(anotherTicket: Ticket)
    {
        let anotherTicketPicks = anotherTicket.picksArray()
        var matchCount = 0
        
        for aPossiblePick in anotherTicketPicks
        {
            if picks.contains(aPossiblePick)
            {
                matchCount++
            }
        }
        
        switch matchCount
        {
        case 3:
            winner = true
            payout = "$1"
        case 4:
            winner = true
            payout = "$5"
        case 5:
            winner = true
            payout = "$20"
        case 6:
            winner = true
            payout = "$100"
        default:
            winner = false
            payout = ""
        }
    }
}