//
//  ViewController.swift
//  TECoreImage
//
//  Created by offcn on 15/8/25.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sliderValue : Float = 0.0

    @IBOutlet weak var scenceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func slider(sender: AnyObject) {
        sliderValue = sender.value
    }
    
    @IBAction func sepia(sender: UIButton) {
        applyFilter(1)
    }
    
    @IBAction func vigentte(sender: UIButton) {
        applyFilter(2)
    }
    
    @IBAction func invert(sender: UIButton) {
        applyFilter(3)
    }
    

    @IBAction func photo(sender: UIButton) {
        applyFilter(4)
        
    }
    @IBAction func Perpective(sender: UIButton) {
        applyFilter(5)
    }
    
    @IBAction func Gaussian(sender: UIButton) {
        applyFilter(6)
    }
    
    func applyFilter(numberFilter: Int) {
        let filePath : NSString = NSBundle.mainBundle().pathForResource("image", ofType: "jpg")!
        let fileUrl : NSURL = NSURL(fileURLWithPath: filePath as String)!
        let inputImage : CIImage = CIImage(contentsOfURL: fileUrl)
        
        switch numberFilter {
        
            case 1:
                /*CIFilter通常有一张或者多张图片输入，通过一些输入参数的设定，输出一张CIImage的对象，参数的设定通常通过键值对设定
                
                
                
                */
                var filter : CIFilter = CIFilter(name: "CISepiaTone")
                 filter.setValue(inputImage, forKey: kCIInputImageKey)
                 filter.setValue(sliderValue, forKey: "InputIntensity")
                let outPutImage : CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
                var img : UIImage = UIImage(CIImage: outPutImage)!
                scenceImageView.image = img
            case 2:
                var filter : CIFilter = CIFilter(name: "CIVignette")
                filter.setValue(inputImage, forKey: kCIInputImageKey)
                filter.setValue(sliderValue, forKey: "InputRadius")
                filter.setValue(sliderValue, forKey: "InputIntensity")
                let outPutImage : CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
                var img : UIImage = UIImage(CIImage: outPutImage)!
                scenceImageView.image = img
            
            case 3:
                var filter : CIFilter = CIFilter(name: "CIColorInvert")
                filter.setValue(inputImage, forKey: kCIInputImageKey)
                let outPutImage : CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
                var img : UIImage = UIImage(CIImage: outPutImage)!
                scenceImageView.image = img
            case 4:
                var filter : CIFilter = CIFilter(name: "CIPhotoEffectMono")
                filter.setValue(inputImage, forKey: kCIInputImageKey)
                let outPutImage : CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
                var img : UIImage = UIImage(CIImage: outPutImage)!
                scenceImageView.image = img
            case 5:
                var filter : CIFilter = CIFilter(name: "CIPerspectiveTransform")
                filter.setValue(inputImage, forKey: kCIInputImageKey)
                let outPutImage : CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
                var img : UIImage = UIImage(CIImage: outPutImage)!
                scenceImageView.image = img
            case 6:
                var filter : CIFilter = CIFilter(name: "CIGaussianBlur")
                filter.setValue(inputImage, forKey: kCIInputImageKey)
                let outPutImage : CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
                var img : UIImage = UIImage(CIImage: outPutImage)!
                scenceImageView.image = img
            default:
                  print("hello")
        
        
        
        
        }
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

