//
//  PublicOrderTreasureConfigure.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
// 配置部分

import UIKit

/// 页面的安全绘图区域
public let Custom_safeInsets = {() -> UIEdgeInsets in
    var _safeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 49, right: 0)
    if #available(iOS 11.0, *) {
        _safeInsets = (UIApplication.shared.keyWindow?.safeAreaInsets)!
    }
    return _safeInsets
}()

/// 颜色便捷设置 与UI工具一致
func RGBA(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor.init(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: alpha)
}

class PublicOrderTreasureConfigure: NSObject {
    
    
    /// 预设置内容
    class func load_Initlizance() {
        ///  解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
        UITableView.appearance().estimatedRowHeight = 0
        UITableView.appearance().estimatedSectionHeaderHeight = 0
        UITableView.appearance().estimatedSectionFooterHeight = 0

        //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never//iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
        }
        
        UINavigationBar.appearance().isTranslucent = false;
        
        //自定义返回按钮
        let resultImage = UIImage.init(named: "back")
        UINavigationBar.appearance().backIndicatorImage = resultImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = resultImage
        UINavigationBar.appearance().tintColor = RGBA(red: 42,green: 42,blue: 42,alpha: 1)

        ///将返回按钮的文字position设置不在屏幕上显示
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: CGFloat(-MAXFLOAT), vertical: 0), for: UIBarMetrics.default)
        
        guard #available(iOS 11.0, *) else {
            return
        }
        let block_viewDidLoad: @convention(block) (AnyObject?) -> Void = {
            info in
            let control = info?.instance() as! UIViewController
            control.automaticallyAdjustsScrollViewInsets = false
        }
        do {
            try UIViewController.aspect_hook(#selector(UIViewController.viewDidLoad), with: AspectOptions.positionBefore, usingBlock: block_viewDidLoad as AnyObject)
        } catch  {
            print(error)
        }
    }
    
}

