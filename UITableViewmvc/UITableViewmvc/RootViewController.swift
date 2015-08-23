//
//  RootViewController.swift
//  UITableViewmvc
//
//  Created by Terry on 15/8/22.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var _dataArray:NSMutableArray?
    var _tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        _dataArray = []
        var path = NSBundle.mainBundle().pathForResource("student", ofType: "plist")
        var array = NSArray(contentsOfFile: path!)
        for  dict in array! {
            var user = UseModel()
            user.userName = (dict as! Dictionary)["UserName"]
            user.telePhone = ( dict as! Dictionary)["Telephone"]
            user.imageString = (dict as! Dictionary)["Photo"]
            _dataArray?.addObject(user)
        
        }
        
        _tableView = UITableView(frame: CGRectMake(0, 24, self.view.frame.size.width, self.view.frame.size.height-64), style: .Plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        self.view.addSubview(_tableView)
        var item = UIBarButtonItem(title: "Edit", style: .Done, target: self, action: Selector("itemClick"))
        self.navigationItem.rightBarButtonItem = item

        // Do any additional setup after loading the view.
    }
    
    func itemClick() {
        if _tableView.editing {
           _tableView.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        
        
        } else {
           _tableView.setEditing(true, animated: true)
           self.navigationItem.rightBarButtonItem?.title = "Done"
        
        }
    
    
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataArray!.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MVC") as? UserTableViewCell
        if cell == nil {
        
           cell = (NSBundle.mainBundle().loadNibNamed("UserTableViewCell", owner: self, options: nil) as NSArray).lastObject as? UserTableViewCell
        }
                var user = _dataArray?.objectAtIndex(indexPath.row) as! UseModel

           cell?.cellConfigure(user)
//        var user = _dataArray?.objectAtIndex(indexPath.row) as! UseModel
//        cell?.textLabel?.text = user.userName
//        cell?.detailTextLabel?.text = user.telePhone
//        cell?.imageView?.image = UIImage(named: user.imageString)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72
    }
    //编辑室要实现的协议方法
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //不知道哪里出问题了.Fade竟然没识别
        _dataArray?.removeObjectAtIndex(indexPath.row)
//        _tableView.deleteRowsAtIndexPaths(NSArray(array: indexPath) as [AnyObject], withRowAnimation:.Fade)
        _tableView.reloadData()
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
