//
//  PublicListViewModel.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//

import UIKit

@objc protocol PublicListViewModelProtocol {
    func updata_setObject(obj:AnyObject)
}

class PublicListViewModel: NSObject,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    static let Identifier = "reuse_cell"
    
    var dataSource:Array<Any>?
    var listView:UIScrollView?{
        set{
            _listView = newValue!
            if let tableView:UITableView = newValue as? UITableView {
                tableView.delegate = self
                tableView.dataSource = self
            }else if let collectionView:UICollectionView = newValue as? UICollectionView{
                collectionView.delegate = self
                collectionView.dataSource = self
            }
            
        }
        get{
            return _listView
        }
    }
    private var _listView:UIScrollView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: PublicListViewModel.Identifier)!
        assert(cell.conforms(to: PublicListViewModelProtocol.self), "UITableViewCell 需遵循 PublicListViewModelProtocol 协议")
        (cell as! PublicListViewModelProtocol).updata_setObject(obj: self.dataSource![indexPath.row] as AnyObject)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PublicListViewModel.Identifier, for: indexPath)
        assert(cell.conforms(to: PublicListViewModelProtocol.self), "UICollectionViewCell 需遵循 PublicListViewModelProtocol 协议")

        (cell as! PublicListViewModelProtocol).updata_setObject(obj: self.dataSource![indexPath.item] as AnyObject)
        return cell
    }
    

}
