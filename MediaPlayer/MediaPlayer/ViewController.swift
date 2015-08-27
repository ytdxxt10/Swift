//
//  ViewController.swift
//  MediaPlayer
//
//  Created by offcn on 15/8/27.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit
import MediaPlayer
class ViewController: UIViewController {
//    var shopCartBlock:(imageview:UIImageView,()->Void)
    var theMovie = MPMoviePlayerController()
    var isPlaying = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("moviePlayBackDidFinish"), name: MPMoviePlayerPlaybackDidFinishNotification, object: theMovie)
        var moviePath = NSBundle.mainBundle().pathForResource("02", ofType: "mov")
        var url = NSURL(fileURLWithPath: moviePath!)
        theMovie = MPMoviePlayerController(contentURL: url)
        theMovie.view.frame = CGRectMake(20, 30, 300, 300)
        theMovie.controlStyle = MPMovieControlStyle.None
        var tapGesture = UITapGestureRecognizer(target: self, action: Selector("didDetectDoubleTap:"))
        tapGesture.numberOfTapsRequired = 2
        theMovie.view.addGestureRecognizer(tapGesture)
        self.view.addSubview(theMovie.view)
        
    }

    @IBAction func playButtonClick(sender: UIButton) {
        theMovie.play()
    }
    
    @IBAction func pauseButtonClick(sender: UIButton) {
        theMovie.pause()
    }
    
    @IBAction func forwardButtonClick(sender: UIButton) {
        theMovie.beginSeekingForward()
    }
    
    @IBAction func rewindButtonClick(sender: UIButton) {
        theMovie.beginSeekingBackward()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didDetectDoubleTap(tapGe:UITapGestureRecognizer) {
    
        if isPlaying {
            theMovie.play()
            isPlaying = !isPlaying
        
        }else {
        
          theMovie.pause()
            isPlaying = !isPlaying
        
        }
    
    }
    func moviePlayBackDidFinish(notification:NSNotification) {
        var alertView = UIAlertView(title: "提示", message: "播放完成", delegate: nil, cancelButtonTitle: "确定")
        alertView.show()
    
    }
}

