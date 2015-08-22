//
//  TabBarRootViewController.swift
//  FreeLimit
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class TabBarRootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//      self.view.backgroundColor = UIColor.cyanColor()
        
        var limitFree = LimitFreeViewController()
        var limitFreeNav = UINavigationController(rootViewController: limitFree)
        limitFree.title = "LimitFree"
        
        var reduction = ReductionViewController()
        var reductionNav = UINavigationController(rootViewController: reduction)
        reduction.title = "Reduction"
        
        var free = FreeViewController()
        var freeNav = UINavigationController(rootViewController: free)
        freeNav.title = "FreeNav"
        
        var subject = SubjectViewController()
        var subjectNav = UINavigationController(rootViewController: subject)
        subject.title = "Subject"
        
        var hot = HotViewController()
        var hotNav = UINavigationController(rootViewController: hot)
        hot.title = "Hot"
        
        var array = [limitFreeNav,reductionNav,freeNav,subjectNav,hotNav]
        self.viewControllers = array
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
