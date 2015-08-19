//
//  ViewController.swift
//  点名程序
//
//  Created by Terry on 15/8/16.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _studentArray:NSMutableArray?
    var _timer:NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _studentArray = ["张三","李四","王二","Terry","Tod","welly","Lily","Lusy"]
        createUI()
        _timer =  NSTimer.scheduledTimerWithTimeInterval(0.21, target: self, selector: Selector("changeName"), userInfo: nil, repeats: true)
        
    }
    
    func changeName(){
    
    var cnt = _studentArray!.count
        var index = arc4random_uniform(UInt32(cnt))
    var label = self.view .viewWithTag(100) as! UILabel
    var s: AnyObject! = _studentArray?.objectAtIndex(Int(index))
        label.text = s  as? String
      
    }
    
    func createUI(){
      
       let label = UILabel(frame: CGRectMake(0, 65, self.view.frame.size.width, 44))
        label.text = "你中奖了"
        label.textColor = UIColor.redColor()
        label.font = UIFont.systemFontOfSize(22)
        label.textAlignment = .Center
        label.tag = 100
        self.view .addSubview(label)
        
        var button = UIButton(frame: CGRectMake(0, 164, self.view.frame.size.width, 44))
        button.setTitle("Stop", forState: .Normal)
        button .setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view .addSubview(button)
    
    }
    
    func buttonClick(button:UIButton){
        if(button.titleLabel!.text == "Stop"){
            var label = self.view.viewWithTag(100) as! UILabel
            label.text = label.text! + "你中奖了"
             button .setTitle("Start", forState: .Normal)
                _timer! .invalidate()
        }else if(button.titleLabel?.text == "Start"){
        
        button.setTitle("Stop", forState: .Normal)
        _timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("changeName"), userInfo: nil, repeats: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

