//
//  ViewController.swift
//  UITableView
//
//  Created by Terry on 15/8/22.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var _tableView:UITableView!
    var _dataSource:NSMutableArray!
    override func viewDidLoad() {
        
        _dataSource = []
        var str = "ABCDEFGHIJKLMN"
        for index in str{
            var array :NSMutableArray = []

            for subindex in 0...4{
                array .addObject("\(index)组 \(subindex)行数据")
            
            }
            _dataSource.addObject(array)
        
        }
        _tableView = UITableView(frame: CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-30), style: .Grouped)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.separatorColor = UIColor.cyanColor()
        _tableView.separatorStyle = .SingleLine
        self.view.addSubview(_tableView)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var muArray: AnyObject = _dataSource[section]
        println(muArray)
        return muArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellID="cellID"
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID")as?UITableViewCell
        if !(cell != nil) {
          cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cellID")
        }
        var muArray: NSArray = _dataSource[indexPath.section] as! NSArray
        cell!.textLabel?.text = muArray[indexPath.row] as? String
        cell?.imageView?.image = UIImage(named: "1.jpg")
        cell?.detailTextLabel?.text = muArray[indexPath.row] as? String
        return cell!
    }
    //返回tableView中有几个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return _dataSource.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "第\(section)组的头视图"
    }
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "第\(section)组的尾视图"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var label = UILabel(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
//        label.textAlignment = .Center
//        label.text = "中超裁判黑哨"
//        label.textColor = UIColor.blueColor()
//        return label
//    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        imageView.image = UIImage(named: "2")
        return imageView
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        var str = "ABCDEFGHIJKLMN"
        var array:NSMutableArray = []
        for c in str {
        
           array.addObject("\(c)")
            
        
        }
        return array as [AnyObject]
       
    }
    //用来返回索引数组的索引和表格视图中分区索引的对应
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

