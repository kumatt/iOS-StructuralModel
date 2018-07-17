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
            naVc.tabBarItem.image = UIImage.init(named: dict[key_normalImage]!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            naVc.tabBarItem.selectedImage = UIImage.init(named: dict[key_selectImage]!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
           
            naVc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 1),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 11)], for: UIControlState.normal)
        naVc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.init(red: 255/255, green: 120/255, blue: 64/255, alpha: 1),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 11)], for: UIControlState.selected)

            self.hook_viewController(viewController: vc)
            self.addChildViewController(naVc)
        }
    }
    
    /// 在控制器跳转时，相应的设置 tabBar 的显隐
    func hook_viewController(viewController:UIViewController) {
        
        let block_viewWillAppear: @convention(block) (AnyObject?) -> Void = {
            info in
            self.setTabBarHidden(isHidden: false)
            }
        do {
            try viewController.aspect_hook(#selector(viewWillAppear(_:)), with: AspectOptions.init(rawValue: 0), usingBlock: block_viewWillAppear as AnyObject)
        } catch  {
            print(error)
        }
        
        
        let block_viewWillDisAppear: @convention(block) (AspectInfo) -> Void = {
            info in
            let control = info.instance()
            if let vc = control as? UIViewController{
                if vc.isKind(of: UINavigationController.classForCoder()){
                    self.setTabBarHidden(isHidden: (((vc as! UINavigationController).viewControllers.count) > 1))
                }else if (vc.navigationController != nil){
                    self.setTabBarHidden(isHidden: ((vc.navigationController?.viewControllers.count)! > 1))
                }
            }
        }
        do {
            try viewController.aspect_hook(#selector(viewWillDisappear(_:)), with: AspectOptions.init(rawValue: 0), usingBlock: block_viewWillDisAppear as AnyObject)
        } catch  {
            print(error)
        }
    }

    /// 底部栏的显隐
    func setTabBarHidden(isHidden:Bool) {
        if self.isTabBarHidden == isHidden {
            return
        }
        self.isTabBarHidden = isHidden
        if #available(iOS 11.0, *) {
            self.tabBar.isHidden = isHidden
            return
        }
//        UIView.animate(withDuration: UINavigationControllerHideShowBarDuration, animations: {() in
//            self.tabBar.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.size.height-49, width: UIScreen.main.bounds.size.width, height: 49)
//        }
    }
}
