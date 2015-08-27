//
//  ViewController.swift
//  NSURLDownloadDelegate
//
//  Created by offcn on 15/8/27.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLSessionDownloadDelegate {

    @IBOutlet weak var theImageView: UIImageView!
    @IBOutlet weak var theProgressView: UIProgressView!
    var session = NSURLSession()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.theProgressView.progress = 0.0
        var sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loadButtonClick(sender: UIButton) {
        
        var imageUrl: NSString = "http://c.hiphotos.baidu.com/image/pic/item/8cb1cb13495409235fa14adf9158d109b2de4942.jpg"
        var getImageTask:NSURLSessionDownloadTask = session.downloadTaskWithURL(NSURL(string: imageUrl as String)!)
        getImageTask.resume()
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        println("download finished")
        var downloadImage = UIImage(data: NSData(contentsOfURL: location)!)

        dispatch_async(dispatch_get_main_queue(), {
        
             self.theImageView.image = downloadImage
        
        })

    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        dispatch_async(dispatch_get_main_queue(), {
        
            var variable = totalBytesWritten/totalBytesExpectedToWrite

           self.theProgressView.progress = Float(variable)
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

