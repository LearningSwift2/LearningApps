//
//  AppDelegate.swift
//  SimpleReminders
//
//  Created by Phil Wright on 12/8/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var badgeCount: Int = 0


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        // Register for Local Notifications
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Sound, .Badge], categories: nil)
        application.registerUserNotificationSettings(settings)
        
        return true
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        print("Received a Local Notification While in the App")
    }
    
    func scheduleLocalNotification(title: String, body: String, fireDate:NSDate) {
        
        let notification = UILocalNotification()
        
        notification.alertTitle = title
        notification.alertBody = body
        notification.fireDate = fireDate
        notification.soundName = "explosion.caf"
        notification.applicationIconBadgeNumber = self.badgeCount
        
        
        // Schedule the notificiation
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        print("scheduled a notification at \(fireDate)")
    }

}

