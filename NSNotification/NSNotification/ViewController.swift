//
//  ViewController.swift
//  NSNotification
//
//  Created by offcn on 15/8/24.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var testTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyBordShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyBoardHidden:"), name: UIKeyboardWillHideNotification, object: nil)
        testTextFiled.delegate = self
    }
    
    func keyBordShow(notification:NSNotification) {
    
        println("keyBordShow")
    
    }
    
    func keyBoardHidden(notification:NSNotification) {
    
        println("keyBoardHidden")
    
    }
    
    //Asks the delegate if the specified text should be changed
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
        
            textField.resignFirstResponder()
            return false
        
        }else {
        
             return true
        }
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

