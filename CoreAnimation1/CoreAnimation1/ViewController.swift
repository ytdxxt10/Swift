//
//  ViewController.swift
//  CoreAnimation1
//
//  Created by Terry on 15/8/26.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appleImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animationButton(sender: UIButton) {
        //The key-path describing the property to be animated.
        var animation:CABasicAnimation = CABasicAnimation(keyPath: "position")
        /* - `fromValue' non-nil. Interpolates between `fromValue' and the
        * current presentation value of the property.
        *
        * - `toValue' non-nil. Interpolates between the layer's current value
        * of the property in the render tree and `toValue'.
        *
        * - `byValue' non-nil. Interpolates between the layer's current value
        * of the property in the render tree and that plus `byValue'. 
        */
        animation.fromValue = NSValue(CGPoint: CGPointMake(appleImageView.frame.midX, appleImageView.frame.midX))
        animation.toValue = NSValue(CGPoint: CGPointMake(appleImageView.frame.midX, 450))
        //An optional timing function defining the pacing of the animation.
        /* A convenience method for creating common timing functions. The
        * currently supported names are `linear', `easeIn', `easeOut' and
        * `easeInEaseOut' and `default' (the curve used by implicit animations
        * created by Core Animation). */
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 2.0
        appleImageView.layer.addAnimation(animation, forKey: "position")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

