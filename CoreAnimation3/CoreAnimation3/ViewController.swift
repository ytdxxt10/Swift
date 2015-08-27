//
//  ViewController.swift
//  CoreAnimation3
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

    @IBAction func animationClick(sender: UIButton) {
        if position {
            
            var path : CGMutablePathRef = CGPathCreateMutable()
            //Starts a new subpath at a specified location in a mutable graphics path.
            CGPathMoveToPoint(path, nil, 160, 400)
            /*
            Appends a cubic Bézier curve to a mutable graphics path
            path	The mutable path to change.
            m	A pointer to an affine transformation matrix, or NULL if no transformation is needed.
            cp1x	The x-coordinate of the first control point.
            cp1y	The y-coordinate of the first control point.
            cp2x	The x-coordinate of the second control point.
            cp2y	The y-coordinate of the second control point.
            x	The x-coordinate of the end point of the curve.
            y	The y-coordinate of the end point of the curve.

           */
            CGPathAddCurveToPoint(path, nil, 83.0, 50.0, 100.0, 100.0, 160.0, 400.0)
            var theAnimation : CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
            theAnimation.path = path
            theAnimation.duration = 5.0
            theAnimation.fillMode = kCAFillModeForwards
            theAnimation.removedOnCompletion = false
            
            var resizeAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.toValue = NSValue(CGPoint: CGPointMake(240, 60))
            resizeAnimation.duration = 5.0
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
            UIView.animateWithDuration(3.0, animations: {
            
                self.appleImageView.alpha = 0.0
                }, completion: {(value:Bool) in
               
                self.appleImageView.layer.addAnimation(theAnimation, forKey: "position")
                self.appleImageView.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
                 self.appleImageView.alpha = 1
            
            })
        
            position = false

        }else {
            var animation : CABasicAnimation = CABasicAnimation(keyPath: "position")
            animation.fromValue = NSValue(CGPoint: CGPointMake(160, 240))
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            
            var resizeAnimation : CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.fromValue = NSValue(CGPoint: CGPointMake(240, 60))
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
            
            self.appleImageView.layer.addAnimation(animation, forKey: "position")
            self.appleImageView.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
            position = true
           
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

