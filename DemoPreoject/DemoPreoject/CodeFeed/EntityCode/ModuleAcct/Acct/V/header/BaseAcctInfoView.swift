//
//  BaseAcctInfoView.swift
//  DDXE-iOS
//
//  Created by ZhangJian on 2018/4/24.
//  Copyright © 2018年 DDTech. All rights reserved.
//
// 用户个人信息

import UIKit

class BaseAcctInfoView: UIView {

    /// 背景图片
    private let imageView_back = UIImageView.init()
    
    /// 头像
    private let imageView_head = UIImageView.init()
    
    /// 头像按钮
    private let button_head = UIButton.init(type: UIButton.ButtonType.custom)
    
    
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
    }
    
    func subView_add() {
        self.add_backImageView()
        self.add_headButton()
        self.add_headImageView()
    }
    
    func subView_layout() {
        
        var topSpace:Float! = 0
//        var bottomSpace:Float! = 0
        switch Int(UIScreen.main.bounds.size.width*UIScreen.main.scale) {
        case 640:
            topSpace = 20 + (100-67)/2.0
//            bottomSpace = (63-30)/2.0
            break
        case 750:
            topSpace = 20 + (121-67)/2.0
//            bottomSpace = (74-30)/2.0
            break
        case 1125:
            topSpace = 44 + (380/3.0-67)/2.0
//            bottomSpace = (222/3.0-30)/2.0
            break
        case 1242:
            topSpace = 20 + (470/3.0-67)/2.0
//            bottomSpace = (240/3.0-30)/2.0
            break
        default:
            topSpace = 35
//            bottomSpace = 10
        }
        
        imageView_back.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.button_head.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(topSpace)
            make.size.equalTo(CGSize.init(width: 67, height: 67))
        }
        self.imageView_head.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
        }

    }
    
        
    //MARK:subView add
    
    func add_backImageView() {
        let imageName = "my_bg_\(Int(UIScreen.main.bounds.size.width*UIScreen.main.scale))"
        var image:UIImage? = UIImage.init(named: imageName)
        if image == nil {
            image = UIImage.init(named: "my_bg_1242")
        }
        imageView_back.image = image
        self.addSubview(imageView_back)
    }
    
    func add_headButton() {
        button_head.backgroundColor = UIColor.white
        button_head.layer.cornerRadius = 33.5
        button_head.clipsToBounds = true
        self.addSubview(button_head)
    }
    func add_headImageView() {
        self.button_head.addSubview(imageView_head)
    }


}
