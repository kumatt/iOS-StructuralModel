//
//  BaseBarViewIndex.swift
//  MenuTreaure
//
//  Created by Mac on 2018/7/17.
//  Copyright © 2018年 OComme. All rights reserved.
//

import UIKit

class BaseBarViewIndex: NSObject {
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
