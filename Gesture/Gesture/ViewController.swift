//
//  ViewController.swift
//  Gesture
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    var imageView:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //6种手势的操作
        /*
        UIGestureRecognizer　下面６种手势都继承于这个类
        
        UITapGestureRecognizer		Tap（点一下）
        UIPinchGestureRecognizer		Pinch（二指往內或往外拨动）
        UIRotationGestureRecognizer	Rotation（旋转）
        UISwipeGestureRecognizer		Swipe（滑动，快速移动，轻扫）
        UIPanGestureRecognizer		Pan （拖移，慢速移动）
        UILongPressGestureRecognizer	LongPress（长按）
        */
      imageView = UIImageView(frame: CGRectMake(120, 300, 100, 100))
        imageView!.image = UIImage(named: "face.png")
        imageView!.userInteractionEnabled = true
        self.view.addSubview(imageView!)
      //点击手势
      tapGesture()
      //平移手势
      panGesture()
      //轻扫手势
      swipeGesture()
      //捏合手势
      pinchGesture()
      //旋转手势
      rotationGesture()
      //长按手势
      longPressGesture()
        
    }
    
    func tapGesture() {
        var view1 = UIView(frame: CGRectMake(0, 24, 30,20 ))
        view1.backgroundColor = UIColor.cyanColor()
        view1.tag = 300;
        self.view.addSubview(view1)
        var tapGestu = UITapGestureRecognizer(target: self, action: Selector("tap:"))
        view1.addGestureRecognizer(tapGestu)
    }
    //点击手势调用的方法
    func tap(tapG:UITapGestureRecognizer) {
//        tapG.view?.backgroundColor = UIColor.blackColor()
        if tapG.view?.frame.size.width < self.view.frame.size.width+200 {
            tapG.view?.transform = CGAffineTransformScale(tapG.view!.transform, 1.5, 1)
        }else {
            tapG.view?.transform = CGAffineTransformScale(tapG.view!.transform, 0.5, 1)
        }
    
    }
    
    //平移手势
    func panGesture() {
        var view2 = UIView(frame: CGRectMake(0, 54, 44, 44))
        view2.backgroundColor = UIColor.blackColor()
        self.view.addSubview(view2)
        var panGesture = UIPanGestureRecognizer(target: self, action: Selector("panGesture:"))
        view2.addGestureRecognizer(panGesture)
    }
    //平移时调用的方法
    func panGesture(pan:UIPanGestureRecognizer) {
       //第一种方法
       //pan.view?.center = pan.locationInView(self.view)
       //第二种
        var center = pan.view!.center
         center = pan.translationInView(self.view)
         center.x += pan.view!.center.x
         center.y += pan.view!.center.y
        pan.view?.center = center
        //因为偏移量的值是累计的，因此 每次 加完后，要把偏移量置为0
        pan.setTranslation(CGPointMake(0, 0), inView: self.view)
    
    }
    //轻扫手势
    func swipeGesture() {
        var label1 = UILabel(frame: CGRectMake(10, 105, 55, 55))
        label1.backgroundColor = UIColor.orangeColor()
        label1.text  = "平移手势"
        label1.font = UIFont.systemFontOfSize(10)
        label1.userInteractionEnabled = true
        self.view .addSubview(label1)
        var swipeGesture = UISwipeGestureRecognizer(target: self, action: Selector("swipeGesture:"))
        swipeGesture.direction = .Up | .Down
        label1.addGestureRecognizer(swipeGesture)
        
    
    }
    
    func swipeGesture(swipe:UISwipeGestureRecognizer) {
        UIView.animateWithDuration(1, animations: {
            swipe.view?.center.x += 50
        
        })
        
    
    }
    //捏合手势
    func pinchGesture() {
  
        
        var pinchGesture = UIPinchGestureRecognizer(target: self, action: Selector("pinchGesture:"))
        pinchGesture.delegate = self
        imageView!.addGestureRecognizer(pinchGesture)
      
    
    
    }
    func pinchGesture(pinch:UIPinchGestureRecognizer) {
        pinch.view?.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale)
    
    
    }
    
    //旋转手势
    func rotationGesture() {
        
      var rotationGesture = UIRotationGestureRecognizer(target: self, action: Selector("rotationGesture:"))
        imageView?.addGestureRecognizer(rotationGesture)
        rotationGesture.delegate = self
    
    
    }
    func rotationGesture(rotation:UIRotationGestureRecognizer) {
    
        rotation.view?.transform = CGAffineTransformMakeRotation(rotation.rotation)
    
    }
    //长按手势
    func longPressGesture() {
        var label2 = UILabel(frame: CGRectMake(120, 390, 100, 100))
        label2.text = "长按手势"
        label2.textColor = UIColor.blackColor()
        label2.userInteractionEnabled = true
        label2.backgroundColor = UIColor.blueColor()
        label2.tag = 2000
        self.view.addSubview(label2)
        var longPressGesture = UILongPressGestureRecognizer(target: self, action: Selector("longPressGesture:"))
        //设置长按的最小时间
        longPressGesture.minimumPressDuration = 1;
        //长按前需要点满多少次才可以触发长按
//        longPressGesture.numberOfTapsRequired = 2;
         //设置手指
//         longPressGesture.numberOfTouchesRequired = 2
        //设置可以移动的范围
        longPressGesture.allowableMovement = 20
         label2.addGestureRecognizer(longPressGesture)
    
    }
    func longPressGesture(longpress:UILongPressGestureRecognizer) {
       var label = self.view.viewWithTag(2000)
         longpress.view?.removeFromSuperview()
         println("haha")
    
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

