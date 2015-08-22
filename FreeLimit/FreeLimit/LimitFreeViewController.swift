//
//  LimitFreeViewController.swift
//  FreeLimit
//
//  Created by offcn on 15/8/20.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class LimitFreeViewController: CustomViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nil, bundle: nil)
        self.addTitle("Limit")
        self.view.backgroundColor = UIColor.brownColor()
        self.addBarButtonWithTitle("left", target: self, action: Selector(""), isLeft: true)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
    
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
