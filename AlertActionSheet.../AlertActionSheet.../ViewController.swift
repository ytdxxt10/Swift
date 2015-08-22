//
//  ViewController.swift
//  AlertActionSheet...
//
//  Created by offcn on 15/8/21.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alertShow()
        
        switchShow()
        activityIndicatorView()
        
        //progress
        progressShow()
        
        sliderShow()
        
        stepperShow()
        
         textView()
        
        segmentShow()
    }
    func alertShow() {
    
        var alert : UIAlertView!
        alert = UIAlertView(title: "Alert", message: "alert detail", delegate: self, cancelButtonTitle: "Certain", otherButtonTitles: "Cancel", "1","2")
        alert.alertViewStyle = .LoginAndPasswordInput
        alert.show()
        
    }
    func activityIndicatorView() {
        var activity = UIActivityIndicatorView(frame: CGRectMake(120, 200, 44, 44))
        activity.activityIndicatorViewStyle = .WhiteLarge
        //设置停止时是否隐藏
        activity.hidesWhenStopped = true
        activity.color = UIColor.blueColor()
        activity.tag = 456
//        activity.startAnimating()
        self.view.addSubview(activity)
    
    
    }
    //switch
    func switchShow() {
    
       var sw = UISwitch(frame: CGRectMake(140, 80, 60, 40))
        sw.tintColor = UIColor.redColor()
        sw.thumbTintColor = UIColor.blueColor()
        sw .setOn(false, animated: true)
        sw.addTarget(self, action: Selector("switchChange:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(sw)
    
    }
    
    func progressShow() {
    
       var progress = UIProgressView(progressViewStyle: .Bar)
        progress.frame = CGRectMake(0, 300, self.view.frame.size.width, 40)
        progress.backgroundColor = UIColor.cyanColor()
        progress.progressTintColor = UIColor.redColor()
        progress.progress = 0.5
        progress.tag = 1000
        self.view.addSubview(progress)
    
    
    }
    
    func sliderShow() {
        var slider = UISlider(frame: CGRectMake(0, 360, self.view.frame.size.width, 40))
//        slider.transform = CGAffineTransformRotate(slider.transform, CGFloat(1.5*M_PI))
        slider.value = 10;
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        slider.addTarget(self, action: Selector("sliderChange:"), forControlEvents: .ValueChanged)
        //设置是否显示改变的值
        slider.continuous = true
        self.view.addSubview(slider)
        
    }
    
    //uistepper步进器
    func stepperShow() {
    
        var stepper = UIStepper(frame: CGRectMake(120, 400, 100, 44))
        stepper.maximumValue = 200
        stepper.minimumValue = 0
        stepper.stepValue = 10
        //设置是否实现显示值的更改
        stepper.continuous = true
        //长按是是否重复
        stepper.autorepeat = true
        //设置是否循环
        stepper.wraps = true
        stepper.addTarget(self, action: Selector("stepperChange:"), forControlEvents: .ValueChanged)
        self.view.addSubview(stepper)
    
    }
    
    //textView
    func textView() {
    
       var textView = UITextView(frame: CGRectMake(10, 400, self.view.frame.size.width, 100))
        textView.text = "天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导天下的第六届领导领导"
        //设置是否可以滚动
        textView.scrollEnabled = true
        //设置是否可以编辑
        textView.editable = true
        textView.backgroundColor = UIColor.cyanColor()
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 10
        textView.delegate = self
        textView.tag = 2000
        self.view.addSubview(textView)
        
    }
    
    func segmentShow() {
        var array = ["1","2","3"]
        var segment = UISegmentedControl(items: array)
        segment.frame = CGRectMake(10, 500, 100, 44)
        segment.selectedSegmentIndex = 2
        segment.addTarget(self, action: Selector("segmentChange:"), forControlEvents: .ValueChanged)
        self.view.addSubview(segment)
    
    }
    //switch加入的方法
    func switchChange(sw:UISwitch) {
        var activi = self.view.viewWithTag(456) as! UIActivityIndicatorView

        if sw.on{
            activi.startAnimating()
        }else {
        
            activi.stopAnimating()
        
        }
        
    
    }
    func sliderChange(slider:UISlider) {
        var progress = self.view.viewWithTag(1000) as! UIProgressView
         progress.progress = slider.value/100
    
    
    }
    func stepperChange(stepper:UIStepper) {
    
     println(stepper.value)
    
    }
    //alertView的代理方法
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.buttonTitleAtIndex(buttonIndex)=="Certain" {
            var login = alertView.textFieldAtIndex(0)
            var passwd = alertView.textFieldAtIndex(1)
            var str = "account:\(login!.text) passWord:\(passwd!.text)"
            var alertView = UIAlertView(title: "tip", message: str, delegate: nil, cancelButtonTitle: "Certain")
            alertView.show()
        
        }
        print(buttonIndex)
    }
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        println("didDismissWithButtonIndex")
    }
    func alertViewCancel(alertView: UIAlertView) {
        println("Cancel")
    }
    func alertViewShouldEnableFirstOtherButton(alertView: UIAlertView) -> Bool {
        println("enableFirstOtherbutton")
        return true
    }
    func segmentChange(segment1:UISegmentedControl) {
    
    
    println("segmentChanged")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var actionSheet:UIActionSheet!
        //这里的delegate是uiActionDelegate，不能用self?
       actionSheet = UIActionSheet(title: "actionSheet", delegate: nil, cancelButtonTitle: "Cancel", destructiveButtonTitle: "haha")
        actionSheet.destructiveButtonIndex = 0
        actionSheet.actionSheetStyle = .BlackTranslucent
        actionSheet.showInView(self.view)
        
    }

    
    //textview的代理方法
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        println("textViewShouldBeginEditing")
        return true
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        println("textViewShouldEndEditing")
        return true
    }
    func textViewDidBeginEditing(textView: UITextView) {
        println("DidBeginEditing")
    }
    func textViewDidEndEditing(textView: UITextView) {
        println("DidEndEditing")
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        println("shouldChangeTextInRange")
        return true
    }
    func textViewDidChange(textView: UITextView) {
        println("didchange")
    }
    //一旦textview上做出动作，就会触发该响应
    func textViewDidChangeSelection(textView: UITextView) {
        println("didchangeselection")
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        var textView = self.view.viewWithTag(2000)
        textView?.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

