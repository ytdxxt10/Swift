//
//  SecondViewController.swift
//  UIViewController
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyanColor()
        // Do any additional setup after loading the view.
        var button = UIButton(frame: CGRectMake(100, 100, 60, 44))
        button.backgroundColor = UIColor.redColor()
        button.setTitle("回去", forState: .Normal)
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    func buttonClick(button:UIButton) {
        
        var vc = ViewController()
        self.dismissViewControllerAnimated(true, completion: {
        
        
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("收到内存警告时候调用")
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
