//
//  ViewController.swift
//  iAd
//
//  Created by offcn on 15/8/25.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit
import iAd
class ViewController: UIViewController,ADBannerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        var banner = ADBannerView(adType: ADAdType.MediumRectangle)
        banner.delegate = self
        banner.center = self.view.center
        self.view.addSubview(banner)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

