//
//  ViewController.swift
//  UILabelDemo
//
//  Created by Terry on 15/8/16.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var label = UILabel(frame: CGRectMake(0, 100, self.view.bounds.size.width, 44));
        label.backgroundColor = UIColor.orangeColor();
        label.text = "Swift my second iOS developer lanaguage,I am learning it now.go,go,go! 0 888";
        //设置为0 时自适应行
        label.numberOfLines = 0;
        //设置折行模式
        label.lineBreakMode = .ByTruncatingMiddle;
        label.textAlignment = .Center;
        label.textColor = UIColor.purpleColor();
        
        //设置字体
        let fontArray = UIFont.familyNames();
        println(fontArray)
        //自定义字体及样式
        label.font = UIFont(name: "LcdD", size: 30);
//        label.font = UIFont.fontNamesForFamilyName("Marion, Copperplate");
//        label.font = UIFont.systemFontOfSize(20);
        label.shadowColor = UIColor.redColor();
        //设置阴影偏移量
        label.shadowOffset = CGSizeMake(-1, -1);
        //设置文本自适应frame的宽度
        label.adjustsFontSizeToFitWidth = true;
        self.view .addSubview(label)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

