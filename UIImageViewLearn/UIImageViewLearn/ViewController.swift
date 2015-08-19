//
//  ViewController.swift
//  UIImageViewLearn
//
//  Created by offcn on 15/8/19.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var girlImageView: UIImageView!
    var _imageArray:NSArray?
    var _imageView:UIImageView!
    var _timer:NSTimer?
    var _x:Bool!
    var _isBird:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _imageView = UIImageView(frame: CGRectMake(0, 24, self.view.frame.size.width/3, self.view.frame.size.height/5))
                self.view .addSubview(_imageView)
        // Do any additional setup after loading the view, typically from a nib.
        _imageArray = ["1","2","3","4","5","6","7","8","0"]
        changeButton.setTitle("Change", forState: .Normal)
        _x = true
    }

    @IBAction func changeImageView(sender: AnyObject) {
        var x = (Int(arc4random()) % _imageArray!.count)
        girlImageView.image = UIImage(named: "\(x)")
        
    }
    @IBAction func hideButtonClick(sender: AnyObject) {
        if sender.titleLabel!!.text == "Hide"{
             changeButton.hidden = true
             girlImageView.hidden = true
             sender.setTitle("Show", forState: .Normal)
            createNewUI()
            
        }
        if sender.titleLabel!!.text == "Show" {
        var alert = UIAlertView(title: "就", message: "不", delegate: nil, cancelButtonTitle: "", otherButtonTitles: "给","你","看")
            self.view.addSubview(alert)
            alert.show()
        
        }
        
    }
    //创建新的UI
    func createNewUI() {
        for index in 1...3 {
            var tempArray = ["企鹅","鹰","猜猜"]
            var height = CGFloat(64+100*index)
            var button = UIButton(frame: CGRectMake(self.view.frame.size.width/3, height, self.view.frame.size.width/3, 44))
            button.tag = 500+index
            button.setTitle(tempArray[index-1], forState: .Normal)
            button.layer.borderColor = UIColor.blueColor().CGColor
            button.layer.borderWidth = 3
            button.setTitleColor(UIColor.blueColor(), forState: .Normal)
            button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
            self.view .addSubview(button)
        
        }
    
    
    
    }
    //新的UI的button的点击方法
    func buttonClick(button:UIButton){
        if button.tag == 501 {
            _isBird = false
            _imageView.stopAnimating()
            var punguinArray:NSMutableArray! = []
            for i in 1...8 {
              var image = UIImage(named: "0\(i).JPG")
                punguinArray?.addObject(image!)
            
            }
            _imageView.animationImages = punguinArray as [AnyObject]
            _imageView.animationDuration = 1
            _imageView.animationRepeatCount = 0
//            _imageView.transform = CGAffineTransformMakeScale(-1, 1)
            
            if (_timer == nil){
            _timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("changeImageView"), userInfo: nil, repeats: true)
            }
        }
        if button.tag == 502 {
            _isBird = true
            _imageView.stopAnimating()
            var birdImageArry:NSMutableArray = []
            for i in 1...18 {
                var image = UIImage(named: "DOVE \(i)")
                birdImageArry.addObject(image!)
            }
             _imageView.animationImages = birdImageArry as [AnyObject]
             _imageView.animationDuration = 0.8
             _imageView.animationRepeatCount = 0
            
            if (_timer == nil){
                _timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("changeImageView"), userInfo: nil, repeats: true)
            }
        
        }
        _imageView.startAnimating()
        if button.tag == 503 {
        
        var alertView = UIAlertView(title: "你", message: "是", delegate: nil, cancelButtonTitle: "", otherButtonTitles: "逗","逼")
            self.view .addSubview(alertView)
            alertView.show()
        
        }
    }
    //定时器的方法
    func changeImageView() {
        if _isBird == false{
            if _x == true{
                _imageView.transform = CGAffineTransformMakeScale(-1, 1)
                _imageView.center.x+=5
                if _imageView.center.x > self.view.frame.size.width {
                    _x = false
                
                }
            
            }
            
            if _x == false {
                _imageView.transform = CGAffineTransformMakeScale(1, 1)
                _imageView.center.x-=5
                if _imageView.center.x < 0 {
                
                    _x = true
                
                }
            
            }
        }
        if _isBird == true {
            if _x == true{
                _imageView.transform = CGAffineTransformMakeScale(1, 1)
                _imageView.center.x+=5
                if _imageView.center.x > self.view.frame.size.width {
                    _x = false
                    
                }
                
            }
            
            if _x == false {
                _imageView.transform = CGAffineTransformMakeScale(-1, 1)
                _imageView.center.x-=5
                if _imageView.center.x < 0 {
                    
                    _x = true
                    
                }
                
            }
            
        
        
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

