//
//  BaseBarViewController.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//

import UIKit

class BaseBarViewController: UIViewController {
    
    private var collect_main:UICollectionView!
    private lazy var collect_viewModel:BaseBarListViewModel! = BaseBarListViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "点菜"
        self.view.backgroundColor = UIColor.white
        self.commit_init()
        // Do any additional setup after loading the view.
    }

    func commit_init() {
        self.subView_add()
        self.subView_layout()
        self.subView_observe()
    }
    
    func subView_add() {
        self.add_mainCollect()
    }
    
    func subView_layout() {
        self.collect_main?.snp.makeConstraints({ (make) in
            make.top.left.right.equalTo(0)
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 49 + Custom_safeInsets.bottom, 0))
        })
    }
    func subView_observe() {
        self.collect_viewModel.listView = self.collect_main
        
        
        self.collect_viewModel.dataSource = ["1","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4","2","3","4"]
        self.collect_main.reloadData()
    }
    
    //MARK:subView add
    func add_mainCollect() {
        let flow = UICollectionViewFlowLayout.init()
        flow.itemSize = CGSize.init(width: 80, height: 83)
        flow.minimumInteritemSpacing = 8
        flow.minimumLineSpacing = 8
        flow.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8)
        
        collect_main = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flow)
        collect_main.backgroundColor = UIColor.white
        collect_main.register(BaseBarCollectCell.classForCoder(), forCellWithReuseIdentifier: PublicListViewModel.Identifier)
        collect_main.showsVerticalScrollIndicator = false
        self.view.addSubview(collect_main)
    }
    
    
}
