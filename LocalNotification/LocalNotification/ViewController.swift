//
//  ViewController.swift
//  LocalNotification
//
//  Created by offcn on 15/8/25.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var notification = UILocalNotification()
        notification.fireDate = NSDate().dateByAddingTimeInterval(10)
        notification.alertBody = "Alert"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

