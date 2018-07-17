//
//  BaseBarViewController.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//

import UIKit

class BaseBarViewController: UIViewController {
    
    private(set) lazy var index_DataModel    = BaseBarDataModelIndex()

    private(set) lazy var index_view         = BaseBarViewIndex()
    
    private(set) lazy var index_viewModel    = BaseBarViewModelIndex()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
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

    
}
