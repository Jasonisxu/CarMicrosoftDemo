//
//  Ext+UIApplication.swift
//  CarDemo
//
//  Created by 刘旭 on 2018/4/17.
//  Copyright © 2018年 Jason. All rights reserved.
//

import Foundation

public extension UIApplication {
    
    public class func currentViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return currentViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return currentViewController(presented)
        }
        
        return base
    }
}
