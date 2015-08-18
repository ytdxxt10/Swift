//
//  ViewController.swift
//  UIView的使用
//
//  Created by offcn on 15/8/18.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var bgView:UIView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        bgView.backgroundColor = UIColor.cyanColor()
        self.view .addSubview(bgView)
        
        var view1:UIView = UIView(frame: CGRectMake(10, 30, 200, 200))
        view1.backgroundColor = UIColor.redColor()
        bgView.addSubview(view1)
        
        var view2:UIView = UIView(frame: CGRectMake(110, 50, 200, 200))
        view2.backgroundColor = UIColor.blueColor()
        bgView.addSubview(view2)
        
        var view3:UIView = UIView(frame: CGRectMake(80, 200, 200, 200))
        view3.backgroundColor = UIColor.blackColor()
        bgView.addSubview(view3)
        //将一个指定的view插入到一个指定索引上
        bgView.insertSubview(view3, atIndex: 0)
        
        //交换两个view的位置，通过索引
        bgView.exchangeSubviewAtIndex(0, withSubviewAtIndex: 2)
        
        //将一个指定的view插入到一个指定的view下面
        bgView.insertSubview(view2, aboveSubview: view1)
        
        //将一个view提到最前面
        bgView.bringSubviewToFront(view1)
        
        //将一个view插到最后面
        bgView.sendSubviewToBack(view3)
        
        viewAnimation(bgView)
        
    }
    
    func viewAnimation(bgView:UIView) {
    
        bgView.hidden = true
        
        var tankView:UIView = UIView(frame: CGRectMake(60, 250, 200, 200))
        tankView.backgroundColor = UIColor(patternImage: UIImage(named: "nomal.png")!)
        tankView.tag = 1000
        self.view.addSubview(tankView)
        
        var button = UIButton(frame: CGRectMake(120, 450, 60, 60))
        button.setTitle("移动", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("move3:"), forControlEvents: .TouchUpInside)
        button.layer.borderColor = UIColor.blueColor().CGColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = button.frame.size.width/2
        button.layer.masksToBounds = true
        self.view.addSubview(button)
        
    
    
    }
    //动画的第一种方法
    func move1(button:UIButton) {
    
     var tankView = self.view .viewWithTag(1000)
        var center:CGPoint = tankView!.center
        center.y -= 100
        tankView?.center = center
    }
    //第二种方法
    func move2(button:UIButton) {
    UIView.beginAnimations("viewAnimation", context: nil)
        var tankView = self.view .viewWithTag(1000)
        var center:CGPoint = tankView!.center
        center.y -= 100
        tankView?.center = center
        UIView .setAnimationDuration(0.5)
        
        UIView.commitAnimations()
    }
    //动画的第三种方法
    func move3(button:UIButton) {
        UIView.animateWithDuration(3, animations: {
        
            var tankView = self.view .viewWithTag(1000)
            var center:CGPoint = tankView!.center
            center.y -= 100
            tankView?.center = center
        })
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

