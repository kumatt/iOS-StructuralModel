//
//  PublicOrderTreasureConfigure.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
// 配置部分

import UIKit
@_exported import SnapKit
@_exported import MagicalRecord
@_exported import Aspects
@_exported import MJRefresh

/// 页面的安全绘图区域
public let Custom_safeInsets = {() -> UIEdgeInsets in
    var _safeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 49, right: 0)
    if #available(iOS 11.0, *) {
        _safeInsets = (UIApplication.shared.keyWindow?.safeAreaInsets)!
    }
    return _safeInsets
}()

class PublicOrderTreasureConfigure: NSObject {
    
    /// 预设置内容
    class func load_prefixHeader() {
        
        /// 初始化数据库
//        MagicalRecord.setupCoreDataStack(withStoreNamed: "MenuData.sqlite")
        
        UITextField.appearance().tintColor = UIColor.my.rgba(255, 120, 64, 1)
        
        ///  解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
        UITableView.appearance().estimatedRowHeight = 0
        UITableView.appearance().estimatedSectionHeaderHeight = 0
        UITableView.appearance().estimatedSectionFooterHeight = 0
        
        UINavigationBar.appearance().isTranslucent = false
        
        //自定义返回按钮
        let resultImage = UIImage.init(named: "back")
        UINavigationBar.appearance().backIndicatorImage = resultImage!
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = resultImage!
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)]

        ///将title 文字的颜色改为透明
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.clear],for: UIControl.State.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.clear],for: UIControl.State.selected)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.clear],for: UIControl.State.disabled)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.clear],for: UIControl.State.highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.clear],for: UIControl.State.focused)
        
        
        //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        }else{
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
        
        /// push 之后隐藏 tabBar
        let block_pushVc: @convention(block) (AspectInfo?) -> Void = {
            info in
            let control = info?.arguments()?.first as? UIViewController
            control?.hidesBottomBarWhenPushed = true
        }
        do{
            try UINavigationController.aspect_hook(#selector(UINavigationController.pushViewController(_:animated:)), with: AspectOptions.positionBefore, usingBlock: block_pushVc as AnyObject)
        }catch{
            print(error)
        }
        
    }
}
