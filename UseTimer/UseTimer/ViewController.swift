//
//  ViewController.swift
//  UseTimer
//
//  Created by Terry on 15/8/18.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _timer:NSTimer?
    var isTimerValid:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var label = UILabel(frame: CGRectMake(10, 50, self.view.frame.size.width, 60))
        label.tag = 1000
        label.text = "00000000"
        label.textAlignment = .Center;
        label.textColor = UIColor.blueColor()
        label.font = UIFont.systemFontOfSize(22)
        self.view .addSubview(label)
        
        var button1 = UIButton(frame: CGRectMake(145, 150, 100, 44))
//        button1.backgroundColor = UIColor.blackColor()
        button1.tag = 2000
        button1.setTitle("Start", forState: .Normal)
        button1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button1.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view .addSubview(button1)
        
        var button2 = UIButton(frame: CGRectMake(145, 200, 100, 44))
        button2.tag = 2001
        button2.setTitle("Pause", forState: .Normal)
        button2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button2.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view .addSubview(button2)
    }
    
    func buttonClick(button:UIButton) {
        if button.tag == 2000 {
            if button.titleLabel?.text == "Start" && isTimerValid == false{
                _timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("changeValue"), userInfo: nil, repeats: true)
                    button .setTitle("Stop", forState: .Normal)
                isTimerValid = true
            
            }else if button.titleLabel?.text == "Start" && isTimerValid == true {
//            _timer?.invalidate()
                var label = self.view.viewWithTag(1000) as! UILabel
                label.text = "00000000"
                button .setTitle("Stop", forState: .Normal)
//                isTimerValid = false
            
                
            }else if button.titleLabel?.text == "Stop"{
            
                button.setTitle("Start", forState: .Normal)
                var label = self.view.viewWithTag(1000) as! UILabel
                label.text = "00000000"
                    _timer?.invalidate()
                isTimerValid = false
            }
        
        
        }
        
        
        if button.tag == 2001 {
        
            if button.titleLabel?.text == "Pause" {
                 _timer?.invalidate()
                isTimerValid = false
                button .setTitle("Resume", forState: .Normal)
            
            }else if button.titleLabel?.text == "Resume" && isTimerValid==false{
            
            button.setTitle("Pause", forState: .Normal)
                 _timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("changeValue"), userInfo: nil, repeats: true)
                isTimerValid = true
            
            }else{
            
             button.setTitle("Pause", forState: .Normal)
            }
        
        }
    
    
    
    }
    
    func changeValue() {
    
        var label = self.view.viewWithTag(1000) as! UILabel
        label.text = String(label.text!.toInt()!+1)

    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

