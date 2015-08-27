//
//  ViewController.swift
//  NSOperation
//
//  Created by offcn on 15/8/27.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var queue = NSOperationQueue()
        let operation1 : NSBlockOperation = NSBlockOperation(block: {
               println("haha")
               println("haha2")
            let operation2:NSBlockOperation = NSBlockOperation(block: {
                  self.loadWebs()
            })
            queue.addOperation(operation2)

        
        })
        queue.addOperation(operation1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadWebs() {
    
         let urls : NSMutableArray = NSMutableArray (objects: NSURL(string: "http://www.apple.com")!,NSURL(string: "http://carlosbutron.es")!, NSURL(string: "http://www.bing.com")!,NSURL(string: "http://www.yahoo.com")!)
        for iterator:AnyObject in urls {
        
             NSData(contentsOfURL: iterator as! NSURL)
            println("download \(iterator)")
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

