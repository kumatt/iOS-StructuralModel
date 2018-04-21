//
//  BaseBarListViewModel.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//

import UIKit

class BaseBarListViewModel: PublicListViewModel {

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:BaseBarCollectCell = collectionView.dequeueReusableCell(withReuseIdentifier: PublicListViewModel.Identifier, for: indexPath) as! BaseBarCollectCell
        cell.isOrder = false
        cell.updata_setObject(obj: self.dataSource![indexPath.row] as AnyObject)
        return cell
    }
}
