//
//  BaseOrderViewIndex.swift
//  DDXE-iOS
//
//  Created by BlanBok on 2018/4/26.
//  Copyright © 2018年 DDTech. All rights reserved.
//
// 显示层目录

import UIKit

class BaseOrderViewIndex: NSObject {
    
    /// 视图容器
    private var containerView:UIView!
    
    /// 设置容器
    func setContainerView(_ container:UIView) {
        self.containerView = container
        
        self.subView_load()
        self.subView_layout()
    }
    
    private func subView_load() {

        
    }
    
    private func subView_layout() {
        
        
    }
    
}
