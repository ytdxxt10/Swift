//
//  RootViewController.swift
//  PassValue
//
//  Created by offcn on 15/8/21.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,passValue {
    var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         var  button = UIButton(frame: CGRectMake(100, 124, 44, 44))
         button.setTitle("进入", forState: .Normal)
         button.setTitleColor(UIColor.blackColor(), forState: .Normal)
         button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
         self.view.addSubview(button)
        
         label = UILabel(frame: CGRectMake(10, 200, self.view.frame.size.width, 44))
          label.textColor = UIColor.redColor()
          label.textAlignment = .Center
          self.view.addSubview(label)
    }
    //单向传值
    func buttonClick(button:UIButton) {
        let subV = SubViewController()
        subV.str = "haha"
        subV.aColure = closure
        //设置代理
        subV.delegate = self
        subV.view.backgroundColor = UIColor.blueColor()
        self.navigationController?.pushViewController(subV, animated: true)
        
    
    
    }
    //用代理实现反向传值
    //实现sub的代理方法
    func textPassValue(str: String) {
        label.text = str
    }
    
    func passColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    //闭包传值实现的方法
    func closure(labelStr:String)->(){
    
     label.text = label.text! + labelStr
    
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
