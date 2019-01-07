//
//  BaseHomeViewController.swift
//  DemoPreoject
//
//  Created by 小虎 on 2019/1/7.
//  Copyright © 2019 OComme. All rights reserved.
//
//BaseHome生命周期控制及业务中转站

import UIKit

class BaseHomeViewController: UIViewController {

    private let index_Model:BaseHomeModelIndex = BaseHomeModelIndex.init()
    
    private let index_view:BaseHomeViewIndex = BaseHomeViewIndex.init()

    private let index_viewModel:BaseHomeViewModelIndex = BaseHomeViewModelIndex.init()

    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setindex_Model()
        setIndex_view()
        setIndex_viewModel()
    }
    
    // MARK: - init
    /// 数据模型初始配置
    private func setindex_Model() {
        
    }
    
    /// 显示层初始配置
    private func setIndex_view() {
        self.index_view.setContainer(self.view)

    }
    
    /// 配置逻辑及业务逻辑初始配置
    private func setIndex_viewModel() {
        
    }
}
