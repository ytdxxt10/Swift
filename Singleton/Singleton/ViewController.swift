//
//  ViewController.swift
//  Singleton
//
//  Created by offcn on 15/8/21.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var application = UIApplication.sharedApplication()
        var appdelegate = application.delegate as! AppDelegate
        appdelegate.array = []
        appdelegate.array.addObject("dhe")
        
        
        var instance = ShareInstanse.shareInstanse
        println(instance._mutableArray)
        instance._mutableArray!.addObject("Terry")
        instance._mutableArray?.addObject("she")
        
        
        
        var button = UIButton(frame: CGRectMake(120, 80, 60, 60))
        button.setTitle("Root", forState: .Normal)
        button.setTitleColor(UIColor.brownColor(), forState: .Normal)
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    func buttonClick(button:UIButton) {
    var svc = SecondViewController()
        svc.modalTransitionStyle = .PartialCurl
        self.presentViewController(svc, animated: true, completion: {})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

