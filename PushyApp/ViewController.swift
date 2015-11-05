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

        let settings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
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
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

    @IBAction func scheduleTapped(sender: UIButton) {
        self.requestPermissionToNotify()
        self.createNotification(5)
    }
}

