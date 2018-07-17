//
//  BaseOrderViewController.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
// 订单信息

import UIKit

class BaseOrderViewController: UIViewController {

    private(set) lazy var index_dataModel    = BaseOrderDataModelIndex()
    
    private(set) lazy var index_view         = BaseOrderViewIndex()
    
    private(set) lazy var index_viewModel    = BaseOrderViewModelIndex()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RGBA(246, 246, 246, 1)
        
        self.commit_init()
        
        
        // Do any additional setup after loading the view.
    }
    
    func commit_init() {
        self.configure_indexView()
        self.configure_indexViewModel()
    }
    
    func configure_indexView() {
        self.index_view.setContainerView(self.view)
        
    }
    
    func configure_indexViewModel() {

        
    }

}
