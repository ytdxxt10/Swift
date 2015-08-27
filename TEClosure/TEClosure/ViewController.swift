//
//  ViewController.swift
//  TEClosure
//
//  Created by offcn on 15/8/27.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    typealias typealiasClosureName = (str1:NSString,int1:Int)->(Int)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //how to declare a closure in Swift
       
        //1. as a variable
        var variableClosureName1:(str1:NSString,int1:Int)->(Int,String)
        //2. as a optional valule
        var optionalValueclosureName:(str1:NSString,int1:Int)->(Int,String)?
        //3.as a type alias:
        typealias typealiasClosureName = (str1:NSString,int1:Int)->(Int,String)
        //4.as a constant
        let constantName:(str1:NSString,int1:Int)->(Int,String)
        //5.as a argument to a function call:
        testClosureDeclaction({(str1:NSString,int1:Int)->(Int) in
         
            return int1
        })
        //6.as a function parameter
         var array = [1,2]
        
        array.sort({(item1:Int,item2:Int)->Bool in return item1>item2})
        
        //7. as a function with implied type 作为函数参数并使用类型判断
        array.sort({(item1,item2)->Bool in return item1>item2})
        
       //8.as a function  作为函数的参数，并推断返回类型
        array.sort({(item1,item2) in return item1>item2})
        
        //9.          作为函数的最后一个参数并且缩写参数名
        array.sort{return $0>$1}
        //10.         作为函数的最后一个参数 并且推断返回值
        array.sort{$0>$1}
        //11.           作为函数的最后一个参数，作为存在函数的引用
        array.sort(<)
       //12.作为函数参数 带默认捕获
        array.sort({[unowned self](item1:Int,item2:Int)->Bool in return item1>item2})
        //13.作为函数参数带默认捕获，且自动推断参数类型和返回值类型
        array.sort({[unowned self] in return $0 < $1})
        


    }
  //as a argument to a function call:
    
    func testClosureDeclaction(closure:typealiasClosureName) {
    
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

