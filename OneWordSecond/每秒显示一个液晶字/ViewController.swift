//
//  ViewController.swift
//  每秒显示一个液晶字
//
//  Created by Terry on 15/8/16.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var n = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lable = UILabel(frame: CGRectMake(0, 65, self.view.bounds.size.width, 100))
        lable.text = "0"
        lable.textColor = UIColor.redColor()
        lable.font = UIFont(name: "LCDd", size: 100)
        lable.font = UIFont.systemFontOfSize(100)
        lable.textAlignment = .Center
        lable.tag = 100
        self.view .addSubview(lable)
        
        
        //创建一个定时器
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("change"), userInfo: nil, repeats: true)
        
 
        
    }
    
    func change(){
        var label = self.view.viewWithTag(100) as! UILabel;
        label.text = "\(n++)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

