//
//  ViewController.swift
//  TECoreImageCIImage
//
//  Created by offcn on 15/8/25.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filePath :NSString = ""
    var fileNamePaht = NSURL()
    var image = CIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        filePath = NSBundle.mainBundle().pathForResource("emotions", ofType: "jpg")!
        fileNamePaht = NSURL.fileURLWithPath(filePath as String)!
        image = CIImage(contentsOfURL: fileNamePaht)
        //CIContext用来呈现CIImage 通过Quartz 2D或者OpenGl
        var context = CIContext(options: nil)
        //CIDetectorAccuracyHigh高精度探测，即使需要更多的时间
        var options = NSDictionary(object: CIDetectorAccuracyHigh, forKey: CIDetectorAccuracy)
        /*CIDetector使用图像处理在静态图像或者视频中来寻找和识别显著特征，如脸，矩形，条形码等
            init!(ofType type: String!, context: CIContext!, options: [NSObject : AnyObject]!) -> CIDetector
            type:返回一个你自己感兴趣的探测器
            context:A Core Image context that the detector can use when analyzing an image.
            options:关于探测器的自己的配置
        
        创建和返回一个自己配置的探测器
        */
        var detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: options as [NSObject : AnyObject])
        
        /*
        func featuresInImage(image: CIImage!, options: [NSObject : AnyObject]!) -> [AnyObject]!
        根据指定的位置在一张图片中寻找到它
        image：你想要探测的图片
        options:指定探测配置
        CIDetectorSmile探测脸部是否存在微笑
        CIDetectorEyeBlink 探测眼睛是否关闭

        */
        var features : NSArray = detector.featuresInImage(image, options: [CIDetectorSmile:true,CIDetectorEyeBlink:true])
        var imageView = UIImageView(image: UIImage(named: "emotions.jpg"))
        self.view.addSubview(imageView)
        
        //auxiliar view to invert 建立一个辅助视图去转换
        
        var vistAux = UIView(frame: imageView.frame)
        for faceFeature in features {
            var smile = faceFeature.hasSmile
            var rightEyeBlinking = faceFeature.rightEyeClosed
            var leftEyeBlinking = faceFeature.leftEyeClosed
           //location face
            
            let faceRect = faceFeature.bounds
            var faceView = UIView(frame: faceRect)
            faceView.layer.borderWidth = 2
            faceView.layer.borderColor = UIColor.redColor().CGColor
            var faceWidth : CGFloat = faceView.frame.width
            var faceHeight: CGFloat = faceView.frame.height
            vistAux.addSubview(faceView)
            
            //location smile 如果有人微笑了，就在嘴上加个绿色圆
            if smile == true {
            
                var smileView = UIView(frame:CGRectMake(faceFeature.mouthPosition.x - faceWidth * 0.18, faceFeature.mouthPosition.y-faceHeight*0.1, faceWidth*0.4, faceHeight*0.2))
                smileView.layer.cornerRadius = faceWidth*0.1
                smileView.layer.borderWidth = 2
                smileView.layer.borderColor = UIColor.greenColor().CGColor
                smileView.layer.backgroundColor = UIColor.greenColor().CGColor
                smileView.layer.opacity = 0.5
                vistAux.addSubview(smileView)
            
            }
            //location right eye
            var rightEyeView = UIView(frame: CGRectMake(faceFeature.rightEyePosition.x-faceWidth*0.2, faceFeature.rightEyePosition.y-faceWidth*0.2, faceWidth*0.4, faceWidth*0.4))
            rightEyeView.layer.borderColor = UIColor.redColor().CGColor
            rightEyeView.layer.cornerRadius = faceWidth * 0.2
            rightEyeView.layer.borderWidth = 2
            if rightEyeBlinking == true {
                //右眼关闭的情况
                rightEyeView.layer.backgroundColor = UIColor.yellowColor().CGColor
            
            }else {
            
                rightEyeView.layer.backgroundColor = UIColor.redColor().CGColor
            }
            rightEyeView.layer.opacity = 0.5
            vistAux.addSubview(rightEyeView)
            
            //location left eye
            var leftEyeView = UIView(frame: CGRectMake(faceFeature.leftEyePosition.x-faceWidth*0.2, faceFeature.leftEyePosition.y-faceWidth * 0.2, faceWidth*0.4, faceWidth*0.4))
            leftEyeView.layer.borderColor = UIColor.blueColor().CGColor
            leftEyeView.layer.borderWidth = 2
            leftEyeView.layer.cornerRadius = faceWidth*0.2
            
            if leftEyeBlinking == true {
            
                leftEyeView.layer.backgroundColor = UIColor.yellowColor().CGColor
                
            
            }else {
                 leftEyeView.layer.backgroundColor = UIColor.blueColor().CGColor
            
            }
            leftEyeView.layer.opacity = 0.5
            vistAux.addSubview(leftEyeView)
            
        
        }
        self.view.addSubview(vistAux)
        vistAux.transform = CGAffineTransformMakeScale(1, -1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

