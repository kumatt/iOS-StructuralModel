//
//  BaseAcctViewController.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
// 个人信息页

import UIKit

class BaseAcctViewController: UIViewController {

//    private(set) lazy var index_DataModel    = BaseAcctDataModelIndex()
    
    private(set) lazy var index_view         = BaseAcctViewIndex()
    
//    private(set) lazy var index_viewModel    = BaseAcctViewModelIndex()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGBA(246, 246, 246, 1)
        self.commit_init()
        
        // Do any additional setup after loading the view.
    }
    
    func commit_init() {
        self.configure_viewIndex()
        self.configure_viewModelIndex()
    }
    
    func configure_viewIndex() {
        self.index_view.setContainerView(self.view)
        
    }
    
    func configure_viewModelIndex() {
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    


}
