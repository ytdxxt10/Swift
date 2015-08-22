//
//  CustomViewController.swift
//  FreeLimit
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addTitle(title:String) {
        var label = UILabel(frame: CGRectMake(0, 0, 50, 44))
        label.text = title
        label.textColor = UIColor.redColor()
        label.textAlignment = .Center
        self.navigationItem.titleView = label
        self.title = title
    
    }
    
    func addBarButtonWithTitle(title:String,target:AnyObject,action:Selector,isLeft:Bool) {
         var button = UIButton(frame: CGRectMake(0, 0, 44, 30))
          button.titleLabel?.textColor = UIColor.blueColor()
        button.setTitle(title, forState: .Normal)
        button.addTarget(target, action: action, forControlEvents:.TouchUpInside)
        var item = UIBarButtonItem(customView: button)
        item.tintColor = UIColor.blueColor()
        
        if isLeft {
        
           self.navigationItem.leftBarButtonItem = item
     
        }else {
        
            self.navigationItem.rightBarButtonItem = item
        
        }
        
        
        
    
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
