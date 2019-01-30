
//
//  PublicViewControllerExtension.swift
//  DemoPreoject
//
//  Created by OComme on 2019/1/29.
//  Copyright © 2019 OComme. All rights reserved.
//

import Foundation

extension UIViewController {
    
    /// app 控制器相关的方法
    class var my: PublicViewControllerConfigure {
        return PublicViewControllerConfigure()
    }
}

class PublicViewControllerConfigure: NSObject {
    
    /// 当前显示的控制器
    var current: UIViewController?{
        return getCurrentViewController(UIApplication.shared.keyWindow?.rootViewController)
    }
    
    func getCurrentViewController(_ viewController: UIViewController?) -> UIViewController? {
        if let presentedVc = viewController?.presentedViewController {
            return getCurrentViewController(presentedVc)
        }
        if let tabBarVc = viewController as? UITabBarController {
            return getCurrentViewController(tabBarVc.selectedViewController)
        }
        if let navigationVc = viewController as? UINavigationController {
            return getCurrentViewController(navigationVc.topViewController)
        }
        return viewController
    }
}
