//
//  ShareInstanse.swift
//  Singleton
//
//  Created by offcn on 15/8/21.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ShareInstanse: NSObject {
    var _mutableArray : NSMutableArray?
    override init() {
        _mutableArray = []
    }
    
    
//    class var shareInstanse:ShareInstanse {
//        
//        struct Static {
//            static let instance:ShareInstanse = ShareInstanse()
//
//        }
//        return Static.instance
//
//    }
    
    class var shareInstanse:ShareInstanse {

            struct Static {
                static var instanse:ShareInstanse? = nil
                static var onceToken:dispatch_once_t = 0
    
            }
            dispatch_once(&Static.onceToken, {
    
            Static.instanse = ShareInstanse()
            
            })
    
    
    return Static.instanse!
    }


    
}
