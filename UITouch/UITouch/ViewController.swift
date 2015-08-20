//
//  ViewController.swift
//  UITouch
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var planeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        CGAffineTransformRotate
    }
   //刚开始触摸屏幕时调用
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("被摸了")
        var touch:UITouch = touches.first as! UITouch
        planeImageView.center = touch.locationInView(self.view)
        if touch.tapCount == 2 {
        
         self.view.backgroundColor = UIColor.cyanColor()
        
        }else{
            
         self.view.backgroundColor = UIColor.whiteColor()
        
        }
        
    }
    //触摸屏幕结束时调用
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("摸完了")
//        planeImageView.center = CGPointMake(200, 450)
    }
    
    //取消触摸时调用
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        println("不摸了")
    }
    
    //在屏幕上移动时调用
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("来回触摸")
        var touch:UITouch = touches.first as! UITouch
        
        if touch.view == planeImageView {
        
        planeImageView.center = touch.locationInView(self.view)
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

