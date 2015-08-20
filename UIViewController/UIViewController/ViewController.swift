//
//  ViewController.swift
//  UIViewController
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "第一个视图控制器"
        var array = ["底部划入","横向翻转","交叉溶解","翻转"]
        for index in 0...3 {
            var height = CGFloat(100+60*index)
        var button = UIButton(frame: CGRectMake(120, height, 100, 44))
        button.backgroundColor = UIColor.redColor()
        button.setTitle(array[index], forState: .Normal)
        button.tag = 400+index
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        }
    }
    
    func buttonClick(button:UIButton) {
      
     var svc = SecondViewController()
        switch button.tag {
        
            case 400:
                svc.modalTransitionStyle = .CoverVertical
            case 401:
                svc.modalTransitionStyle = .FlipHorizontal
            case 402:
                svc.modalTransitionStyle = .CrossDissolve
            case 403:
                svc.modalTransitionStyle = .PartialCurl
            default:
                 println("haha")

        
        }
        
        self.presentViewController(svc, animated: true, completion: nil)
    
    }
    override func viewWillAppear(animated: Bool) {
        println("viewWillAppear")
    }
    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("viewDidDisappear")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

