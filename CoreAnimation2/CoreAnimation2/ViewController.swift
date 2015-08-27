//
//  ViewController.swift
//  CoreAnimation2
//
//  Created by offcn on 15/8/27.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appleImageView: UIImageView!
    var position = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    @IBAction func animation(sender: UIButton) {
        if position {
            //以这种position和bounds.size的到达该处

           var animation = CABasicAnimation(keyPath: "position")
            animation.toValue = NSValue(CGPoint: CGPointMake(160, 400))
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            
            var resizeAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.toValue = NSValue(CGPoint: CGPointMake(240, 40))
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
            UIView.animateWithDuration(5.0, animations: {
                  //图片将在5s内alpha变为0
                  self.appleImageView.alpha = 0.0
            
                }, completion: {(value:Bool) in
                  //当上面的View动画完成后，将执行下面语句
                    self.appleImageView.alpha = 1.0

                    self.appleImageView.layer.addAnimation(animation, forKey: "position")
                    self.appleImageView.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
            
            })

            position = false
        
        }else {
            //以这种position和bounds.size的动画形式回到原处
            var animation = CABasicAnimation(keyPath: "position")
            animation.fromValue = NSValue(CGPoint: CGPointMake(160, 490))
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            
            var resizeAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.fromValue = NSValue(CGPoint: CGPointMake(240, 100))
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
           
            UIView.animateWithDuration(3.0, animations: {
                 self.appleImageView.alpha = 0.1
            
            
                }, completion: {(value:Bool)in
                    self.appleImageView.layer.addAnimation(animation, forKey: "position")
                     self.appleImageView.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
                    self.appleImageView.alpha = 0.9
                  
            })
           
        
            position = true
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

