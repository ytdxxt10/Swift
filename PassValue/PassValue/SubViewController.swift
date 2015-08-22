//
//  SubViewController.swift
//  PassValue
//
//  Created by offcn on 15/8/21.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit
protocol passValue {
    func textPassValue(str:String)
    func passColor(color:UIColor)
}

typealias sendValueClosure = (string:String)->Void
class SubViewController: UIViewController {
    var str:String?
    var delegate:passValue?
    
    var aColure:sendValueClosure?
    override func viewDidLoad() {
        super.viewDidLoad()
        println(str)
        var  button = UIButton(frame: CGRectMake(100, 124, 44, 44))
        button.setTitle("回去", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        var label = UILabel(frame: CGRectMake(120, 200, self.view.bounds.size.width, 60))
        label.backgroundColor = UIColor.clearColor()
        label.text = str
        label.textColor = UIColor.blueColor()
        label.textAlignment = .Center
        self.view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }
    func buttonClick(button:UIButton) {
        self.delegate?.textPassValue("textPassValue")
        self.delegate?.passColor(UIColor.greenColor())
        aColure!(string:"闭包回传偶")
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
