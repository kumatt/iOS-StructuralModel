//
//  BaseAcctViewIndex.swift
//  MenuTreaure
//
//  Created by Mac on 2018/7/17.
//  Copyright © 2018年 OComme. All rights reserved.
//

import UIKit

class BaseAcctViewIndex: NSObject {
    /// 视图容器
    private var containerView:UIView!
    /// 设置容器
    func setContainerView(_ container:UIView) {
        self.containerView = container
        
        self.subView_load()
        self.subView_layout()
    }
    
    let view_head = BaseAcctInfoView();
    
    private func subView_load() {
        
        self.containerView.addSubview(self.view_head)

    }
    
    private func subView_layout() {
        
        view_head.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
        }
    }
}
