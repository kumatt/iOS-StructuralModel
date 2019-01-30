
//
//  BaseTabBarViewController.swift
//  DemoPreoject
//
//  Created by OComme on 2019/1/7.
//  Copyright © 2019 OComme. All rights reserved.
//
//窗口的根控制器

import UIKit

class BaseTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBar.barTintColor = UIColor.tabBarItemBackGround()
        self.tabBar.backgroundColor = UIColor.tabBarItemBackGround()
        self.add_childController()
    }
    
    /// 添加分栏页
    func add_childController() {
        for dict in self.create_itemsData() {
            assert((dict[TabBarItemKey.vcClass.rawValue]?.isEmpty)! == false, "tabBarItem 类名不能为空")
            
            let controllerClass = NSClassFromString(dict[TabBarItemKey.vcClass.rawValue]!) as! UIViewController.Type
            let vc = controllerClass.init()
            let naVc = UINavigationController.init(rootViewController: vc)
            
            naVc.navigationBar.barTintColor = UIColor.tabBarItemBackGround()
            
            vc.title = dict[TabBarItemKey.title.rawValue]!
            vc.hidesBottomBarWhenPushed = false
            
            naVc.tabBarItem.image = UIImage.init(named: dict[TabBarItemKey.normalImage.rawValue]!)!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            naVc.tabBarItem.selectedImage = UIImage.init(named: dict[TabBarItemKey.selectImage.rawValue]!)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            
            naVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 1),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11)], for: UIControl.State.normal)
            naVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 255/255, green: 120/255, blue: 64/255, alpha: 1),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11)], for: UIControl.State.selected)
            
            addChild(naVc)
        }
    }
}

/// 通用数据
extension BaseTabBarViewController{
    /// 解析 item 数据的key
    enum TabBarItemKey : String {
        case title       = "title"
        case vcClass     = "controllerClass"
        case normalImage = "normalImage_name"
        case selectImage = "selectImage_name"
    }
}

extension UIColor {
    /// item 的背景色
    class func tabBarItemBackGround() -> UIColor {
        return self.init(red: 61/255.0, green: 61/255.0, blue: 61/255.0, alpha: 1)
    }
}

/// 配置数据
extension BaseTabBarViewController{
    /// 分栏页相关数据
    func create_itemsData()-> Array<Dictionary<String,String>> {
        var itemsArray = Array<Dictionary<String,String>>.init()
        itemsArray.append([TabBarItemKey.title.rawValue:"首页",TabBarItemKey.vcClass.rawValue:NSStringFromClass(BaseHomeViewController.self),TabBarItemKey.normalImage.rawValue:"table",TabBarItemKey.selectImage.rawValue:"table"])
//        itemsArray.append([TabBarItemKey.title.rawValue:"订单",TabBarItemKey.vcClass.rawValue:NSStringFromClass(BaseOrderViewController.self),TabBarItemKey.normalImage.rawValue:"order",TabBarItemKey.selectImage.rawValue:"order"])
//        itemsArray.append([TabBarItemKey.title.rawValue:"账户",TabBarItemKey.vcClass.rawValue:NSStringFromClass(BaseAcctViewController.self),TabBarItemKey.normalImage.rawValue:"my",TabBarItemKey.selectImage.rawValue:"my"])
        return itemsArray
    }
}
