//
//  BaseBarCollectCell.swift
//  OrderTreasure
//
//  Created by ZhangJian on 2018/4/20.
//  Copyright © 2018年 ZhangJian. All rights reserved.
//
//桌台cell

import UIKit
import SnapKit


@objcMembers class BaseBarCollectCell: UICollectionViewCell,PublicListViewModelProtocol {
    
    private var label_title:UILabel!
    
    /// 是否点餐
     var isOrder:Bool! = false
    
    
    @objc func updata_setObject(obj: AnyObject) {
        label_title.text = "1"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commit_init()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commit_init()
    }
    
    func commit_init() {
        self.subView_add()
        self.subView_layout()
        self.subView_observe()
        
        self.contentView.layer.cornerRadius = 9
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = RGBA(red: 221, green: 221, blue: 221, alpha: 1).cgColor
    }
    
    func subView_add() {
        self.add_titleLabel()
    }
    
    func subView_layout() {
        label_title.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.lessThanOrEqualToSuperview().offset(-15)
        }
    }
    
    func subView_observe() {
        
        
    }
    
    //MARK:subView add
    func add_titleLabel() {
        label_title = UILabel.init()
        label_title.font = UIFont.systemFont(ofSize: 20)
        label_title.textColor = UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        self.contentView.addSubview(label_title)
    }
}
