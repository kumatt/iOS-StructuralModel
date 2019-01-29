//
//  PublicListViewModel.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
//  数据列表的配置逻辑

import UIKit

/// 复用标识
public enum PublicListReuseIdentifier: String {
    /// 普通cell
    case cell   = "__reuse_cell"
    /// 无数据cell
    case none   = "__reuse_noneCell"
    /// 行首
    case header = "__reuse_header"
    /// 行尾
    case footer = "__reuse_footer"
}
/// 复用标识的生成方法
extension PublicListReuseIdentifier{
    /// cell过多时，进行字段拼接
    func next(_ plus: String) -> String {
        return self.rawValue + plus
    }
}

/// cell 刷新数据协议
protocol PublicListViewModelProtocol: NSObjectProtocol {
    func updata_setObject(obj: Any?)
}

/// 关于数据列表的显示逻辑
class PublicListViewModel: NSObject {
    /// 最小页码
    private static let minPage:Int  = 1
    /// 预计每页请求的数据量
    private static let pageSize:Int = 10

    /// 当前向数据库发送情求的页码
    var currentPage:Int! = minPage
    /// 数据源
    var dataSource:[Any] = Array.init()
    /// 数据列表
    private(set) var listView:UIScrollView?
    /// 设置数据列表
    func setListView(_ listView:UIScrollView) {
        setListDelegate(nil)
        self.listView = listView
        setListDelegate(self)
    }
    
    /// 设置代理
    func setListDelegate(_ delegate: PublicListViewModel?) {
        if let tableView = self.listView as? UITableView {
            tableView.delegate = delegate
            tableView.dataSource = delegate
            return
        }
        if let collectionView = self.listView as? UICollectionView{
            collectionView.delegate = delegate
            collectionView.dataSource = delegate
            return
        }
    }
}

/// 数据刷新相关方法
extension PublicListViewModel{
    /// 数据刷新状态
    enum PublicListViewModelRefreshType {
        /// 已加载全部数据
        case noMore
        /// 重新开始加载数据
        case resetNoMore
        /// 结束刷新
        case end
    }
    
    /// 下拉刷新
    @objc public func refreshHeader() {
        currentPage = PublicListViewModel.minPage
        refreshLoad()
    }
    /// 上拉加载
    @objc public func refreshFooter() {
        currentPage = currentPage + 1
        refreshLoad()
    }
    /// 数据网络请求的实现
    func refreshLoad() {
        
    }
    /// 计算当前的数据刷新状态
    func getRefreshType(with resultArray:[Any]?, minPage: Int = minPage, pageSize: Int = pageSize) -> PublicListViewModelRefreshType {
        if dataSource.count < pageSize {
            return .noMore
        }
        if currentPage == minPage {
            return .resetNoMore
        }
        return .end
    }
}

/// tableView 代理方法
extension PublicListViewModel: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PublicListReuseIdentifier.cell.rawValue, for: indexPath)
        assert((cell as? PublicListViewModelProtocol) != nil, "UICollectionViewCell 需遵循 PublicListViewModelProtocol 协议")
        (cell as? PublicListViewModelProtocol)?.updata_setObject(obj: self.dataSource[indexPath.item])
        
        return cell
    }
    
}

/// collectionView 代理方法
extension PublicListViewModel: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: PublicListReuseIdentifier.cell.rawValue)!
        assert(((cell as? PublicListViewModelProtocol) != nil), "UITableViewCell 需遵循 PublicListViewModelProtocol 协议")
        (cell as? PublicListViewModelProtocol)?.updata_setObject(obj: self.dataSource[indexPath.row])
        
        return cell
    }
    
}
