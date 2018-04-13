//
//  LXGCDHelper.swift
//  CarDemo
//
//  Created by 刘旭 on 2018/4/13.
//  Copyright © 2018年 Jason. All rights reserved.
//

import UIKit



//MARK:            延时使用        ____________________________________________________________________________________________________

typealias TaskBlock = (_ cancel : Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping ()->()) ->  TaskBlock? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure: (()->Void)? = task
    var result: TaskBlock?
    
    let delayedClosure: TaskBlock = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}
