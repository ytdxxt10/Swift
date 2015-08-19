//
//  ViewController.swift
//  DockMode
//
//  Created by Terry on 15/8/19.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var imageView = UIImageView(frame: CGRectMake(50, 100, 200, 200))
        imageView.backgroundColor = UIColor.cyanColor()
        imageView.image = UIImage(named: "bossfirst")
        self.view.addSubview(imageView)
        //停靠模式
        
        //设置图片的停靠模式
        /*
        //改变图片比例去填充
        UIViewContentModeScaleToFill,
        //不改变原图比例，短边充满
        UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
        //不改变原图比例，长边充满
        UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
        UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
        //居中显示
        UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
        //靠上显示
        UIViewContentModeTop,
        //靠下显示
        UIViewContentModeBottom,
        //靠左
        UIViewContentModeLeft,
        //靠右
        UIViewContentModeRight,
        //左上
        UIViewContentModeTopLeft,
        //右上
        UIViewContentModeTopRight,
        //左下
        UIViewContentModeBottomLeft,
        //右下
        UIViewContentModeBottomRight,
        
        */

        imageView.contentMode = .Top
        
        
        //view的transform
        
        var view = UIView(frame: CGRectMake(50, 320, 200, 100))
        //CGAffineTransformMakeScale
        //第一个参数用来改变宽的倍数
        //第二个参数用来改变高的倍数
        view.backgroundColor = UIColor.cyanColor()
//        view.transform = CGAffineTransformMakeScale(2, 1)
//        view.transform = CGAffineTransformScale(view.transform, -1, -2)
        
        //旋转
        view.transform = CGAffineTransformRotate(view.transform, 120)
        //平移
        view.transform = CGAffineTransformTranslate(view.transform, 50, 100)
        self.view.addSubview(view)
        
        var label = UILabel(frame: CGRectMake(0, 0, 120, 80))
        label.text = "ABCDER"
        label.textColor = UIColor.redColor()
        label.font = UIFont.systemFontOfSize(22)
        view.addSubview(label)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

