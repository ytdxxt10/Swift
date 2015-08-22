//
//  SecondViewController.swift
//  Singleton
//
//  Created by offcn on 15/8/21.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.cyanColor()
        var app = UIApplication.sharedApplication()
        var appdelegate = app.delegate as! AppDelegate
        println(appdelegate.array)
        let instance = ShareInstanse.shareInstanse
        instance._mutableArray?.removeObject("she")
        instance._mutableArray?.addObject("sub")
        println(instance._mutableArray)
        
        var button = UIButton(frame: CGRectMake(120, 80, 60, 60))
        button.setTitle("Sub", forState: .Normal)
        button.setTitleColor(UIColor.brownColor(), forState: .Normal)
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)

        // Do any additional setup after loading the view.
    }
    func buttonClick(button:UIButton) {
    
        self.dismissViewControllerAnimated(true, completion: {})
    
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
