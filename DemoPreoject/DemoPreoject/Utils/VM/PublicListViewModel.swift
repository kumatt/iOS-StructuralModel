//
//  PublicListViewModel.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//

import UIKit

/// cell 刷新数据协议
protocol PublicListViewModelProtocol: NSObjectProtocol {
    func updata_setObject(obj:AnyObject)
}

class PublicListViewModel: NSObject,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    /// 复用标识
    public enum PublicListReuseIdentifier: String {
        case cell   = "reuse_cell"
        case none   = "reuse_noneCell"
        case header = "reuse_header"
        case footer = "reuse_footer"
    }
    
    /// 数据源
    var dataSource:Array<Any> = Array.init()
    
    /// 列表视图
    var listView:UIScrollView?
    
    func setListView(_ listV:UIScrollView) {
        resetListDelegate()
        self.listView = listV
        resetListDelegate(self)
    }
    
    /// 设置代理
    func resetListDelegate(_ delegate: PublicListViewModel? = nil) {
        if let tableView:UITableView = self.listView as? UITableView {
            tableView.delegate = delegate
            tableView.dataSource = delegate
            return
        }
        if let collectionView:UICollectionView = self.listView as? UICollectionView{
            collectionView.delegate = delegate
            collectionView.dataSource = delegate
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: PublicListReuseIdentifier.cell.rawValue)!
        assert(((cell as? PublicListViewModelProtocol) != nil), "UITableViewCell 需遵循 PublicListViewModelProtocol 协议")
        (cell as? PublicListViewModelProtocol)?.updata_setObject(obj: self.dataSource[indexPath.row] as AnyObject)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PublicListReuseIdentifier.cell.rawValue, for: indexPath)
        assert((cell as? PublicListViewModelProtocol) != nil, "UICollectionViewCell 需遵循 PublicListViewModelProtocol 协议")

        (cell as? PublicListViewModelProtocol)?.updata_setObject(obj: self.dataSource[indexPath.item] as AnyObject)
        return cell
    }
}
