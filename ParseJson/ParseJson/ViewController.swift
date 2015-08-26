//
//  ViewController.swift
//  ParseJson
//
//  Created by offcn on 15/8/25.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var jsImageView: UIImageView!

    @IBOutlet weak var jsLabel: UILabel!
    
    @IBOutlet weak var jsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var jsonUrl = "https://itunes.apple.com/es/rss/topfreeapplications/limit=10/json"
        dispatch_async(dispatch_get_global_queue(0, 0), {
//            var request = NSURLRequest(URL: NSURL(string: jsonUrl)!)
             var data = NSData(contentsOfURL: NSURL(string: jsonUrl)!)
            
            dispatch_async(dispatch_get_main_queue(), {
               var json = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                var dic1: AnyObject = ((json["feed"] as! NSDictionary)["entry"] as! NSArray)[2]
                var imgStr: AnyObject = (dic1["im:image"] as! NSArray)[2]
                var url = NSURL(string: imgStr.objectForKey("label") as! String)
                var data = NSData(contentsOfURL: url!)                
                self.jsImageView.image = UIImage(data: data!)
                var title = (dic1["title"] as! NSDictionary)["label"] as! NSString
                
                var desc = (dic1["summary"] as! NSDictionary)["label"] as! NSString
                self.jsLabel.text = title as? String
                self.jsTextView.text = desc as? String
            
                
            
            
            })
        
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

