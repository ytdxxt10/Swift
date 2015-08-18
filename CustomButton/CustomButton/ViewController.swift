//
//  ViewController.swift
//  CustomButton
//
//  Created by offcn on 15/8/18.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customButton.backgroundColor = UIColor.whiteColor()
        customButton.setTitle("自定义按钮", forState: .Normal)
        customButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        customButton.layer.cornerRadius = customButton.frame.width/2
        customButton.layer.masksToBounds = true
        customButton.layer.borderColor = UIColor.blueColor().CGColor
        customButton.layer.borderWidth = 2
        customButton.tag = 1000
        customButton.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        customButton .setImage(UIImage(named: "04"), forState: .Normal)
        
        
    }

    func buttonClick(button:UIButton){
//        var alertView:UIAlertView = UIAlertView(title: "提示", message: "自定义按钮", delegate: nil, cancelButtonTitle: "确定")
        var alertView : UIAlertView = UIAlertView(title: "提示", message: "自定义按钮的点击事件", delegate: nil, cancelButtonTitle: "确定", otherButtonTitles: "取消","哈哈")
        alertView.show()
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

