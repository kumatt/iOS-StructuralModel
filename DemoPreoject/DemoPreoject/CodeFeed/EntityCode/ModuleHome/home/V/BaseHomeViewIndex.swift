//
//  BaseHomeViewIndex.swift
//  DemoPreoject
//
//  Created by OComme on 2019/1/7.
//  Copyright © 2019 OComme. All rights reserved.
//
//BaseHome显示部分索引

import UIKit

class BaseHomeViewIndex: NSObject {

    /// view container
    private(set) var container:UIView?
    
    
    // MARK: - subView init
    func setContainer(_ container: UIView) {
        self.container = container
        
        subView_load()
        subView_layout()
    }

    private func subView_load() {
        
    }
    
    private func subView_layout() {
        
    }
    
    // MARK: - subView load

}
