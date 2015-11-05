//
//  ViewController.swift
//  PushyApp
//
//  Created by Miguel Fagundez on 11/4/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func requestPermissionToNotify(){
        
         // Action 1
        
        let floatAction = UIMutableUserNotificationAction()
        floatAction.identifier = "FLOAT_ACTION"
        floatAction.title = "Float"
        
        // Load or not the app into foreground
        floatAction.activationMode = UIUserNotificationActivationMode.Background

        // About rendering
        floatAction.destructive = true
        
        // Access to password protected resources would require authentication
        floatAction.authenticationRequired = false
        
        // Action 2
        
        let stringAction = UIMutableUserNotificationAction()
        stringAction.identifier = "STRING_ACTION"
        stringAction.title = "String"
        stringAction.activationMode = UIUserNotificationActivationMode.Foreground
        stringAction.destructive = false
        stringAction.authenticationRequired = false
        
        // Category of both actions
        let category = UIMutableUserNotificationCategory()
        category.identifier = "MAIN_CATEGORY"
        category.setActions([floatAction, stringAction], forContext: .Default)
        
        
        
        
        // Ask for permission
        let settings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: [category])
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)

        
    }
    
    func createNotification(secondsInFuture: Int){
        let notification = UILocalNotification()

        notification.fireDate = NSDate(timeIntervalSinceNow: Double(secondsInFuture))
        
        notification.timeZone = nil
        
        notification.alertTitle = "Title"
        notification.alertBody = "Body"
        notification.alertAction = "Action"
        notification.soundName = UILocalNotificationDefaultSoundName
        
        notification.applicationIconBadgeNumber = 4123
        
        notification.category = "MAIN_CATEGORY"
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

    @IBAction func scheduleTapped(sender: UIButton) {
        self.requestPermissionToNotify()
        self.createNotification(5)
    }
}

