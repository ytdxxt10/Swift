//
//  ViewController.swift
//  UITextFiled
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var _textFiled:UITextField?
    var _textLable:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _textLable = UILabel(frame: CGRectMake(0, 24, self.view.frame.size.width, 60))
        _textLable?.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(_textLable!)
        
        _textFiled = UITextField(frame: CGRectMake(10, 160, self.view.frame.size.width-20, 56))
        _textFiled?.borderStyle = .RoundedRect
        _textFiled?.placeholder = "请输入内容"
        _textFiled?.textColor = UIColor.blueColor()
        _textFiled?.font = UIFont.systemFontOfSize(18)
        _textFiled?.textAlignment = .Left
        _textFiled?.clearButtonMode = .Always
        _textFiled?.clearsOnBeginEditing = false
        _textFiled?.secureTextEntry = true
        //键盘的呈现样式
        _textFiled?.keyboardType = .EmailAddress
        //键盘的呈现颜色
        _textFiled?.keyboardAppearance = .Dark
        _textFiled?.returnKeyType = .Go
        _textFiled?.adjustsFontSizeToFitWidth = true
        _textFiled?.delegate = self
        self.view.addSubview(_textFiled!)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keybordShow:"), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keybordHide:"), name: UIKeyboardDidHideNotification, object: nil)
        
    }
    //textFiled 的代理方法
    func textFieldDidEndEditing(textField: UITextField) {
        println("结束编辑时调用")
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        println("开始编辑时调用")

    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("shouldEndEditing")
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        _textLable?.text = _textFiled?.text

        return true
    }
    func textFieldShouldClear(textField: UITextField) -> Bool {
        println("shouldClear")
        return true
    }
    //键盘的弹起和隐藏
    func keybordShow(obj:AnyObject) {
    
     println("键盘弹起了啊")
    
    }
    
    func keybordHide(obj:AnyObject) {
        
    println("键盘落下啊")
        
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        _textFiled?.resignFirstResponder()
        _textLable?.text = _textFiled?.text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

