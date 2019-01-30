
//
//  PublicViewExtension.swift
//  DemoPreoject
//
//  Created by OComme on 2019/1/29.
//  Copyright © 2019 OComme. All rights reserved.
//

import Foundation

extension UIView {
    
    /// app 控制器相关的方法
    var my: PublicViewConfigure {
        return PublicViewConfigure(self)
    }
}

class PublicViewConfigure: NSObject {
    
    
    var view: UIView!
    
    init(_ view: UIView) {
        super.init()
        self.view = view
    }
    
    
    /// 当前显示的控制器
    var viewController: UIViewController?{
        return getViewController(self.view)
    }
    
    func getViewController(_ view: UIView?) -> UIViewController? {
        if let vc = view?.next as? UIViewController {
            return vc
        }
        if let nextView = view?.next as? UIView {
            return getViewController(nextView)
        }
        return nil
    }
}
