//
//  RootViewController.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/19.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
//窗口的根控制器

import UIKit

class RootViewController: UITabBarController {
    
    private var isTabBarHidden = false
    
    private let key_title = "title"
    private let key_class = "controllerClass"
    private let key_normalImage = "normalImage_name"
    private let key_selectImage = "selectImage_name"

    private let color_backGround = UIColor.init(red: 61/255.0, green: 61/255.0, blue: 61/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBar.barTintColor = color_backGround
        self.tabBar.backgroundColor = color_backGround
        self.add_childController()
    }

    
    /// 分栏页相关数据
    func create_itemsData()-> Array<Dictionary<String,String>> {
        var itemsArray = Array<Dictionary<String,String>>.init()
        itemsArray.append([key_title:"首页",key_class:NSStringFromClass(BaseBarViewController.self),key_normalImage:"table",key_selectImage:"table"])
        itemsArray.append([key_title:"订单",key_class:NSStringFromClass(BaseOrderViewController.self),key_normalImage:"order",key_selectImage:"order"])
        itemsArray.append([key_title:"账户",key_class:NSStringFromClass(BaseAcctViewController.self),key_normalImage:"my",key_selectImage:"my"])
        return itemsArray
    }
    
    /// 添加分栏页
    func add_childController() {
        for dict in self.create_itemsData() {
            assert((dict[key_class]?.isEmpty)! == false, "tabBarItem 类名不能为空")
            
            let controllerClass = NSClassFromString(dict[key_class]!) as! UIViewController.Type
            let vc = controllerClass.init()
            let naVc = UINavigationController.init(rootViewController: vc)
            
            naVc.navigationBar.barTintColor = color_backGround

            vc.title = dict[key_title]!
            vc.hidesBottomBarWhenPushed = false
            
            naVc.tabBarItem.image = UIImage.init(named: dict[key_normalImage]!)!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            naVc.tabBarItem.selectedImage = UIImage.init(named: dict[key_selectImage]!)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

            naVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 1),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11)], for: UIControl.State.normal)
            naVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 255/255, green: 120/255, blue: 64/255, alpha: 1),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11)], for: UIControl.State.selected)

            addChild(naVc)
        }
    }

}
