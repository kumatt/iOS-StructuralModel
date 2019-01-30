//
//  PublicAcctManager.swift
//  DemoPreoject
//
//  Created by OComme on 2019/1/30.
//  Copyright © 2019 OComme. All rights reserved.
//
//  账号管理类

import UIKit

/// 成员变量列表
class PublicAcctManager {
    /// 单例
    static let share = PublicAcctManager()
    /// 防止外部通过init直接创建实例。
    private init() {}

    /// 数据模型
    var dataModel: PublicAcctModel = PublicAcctModel.init()
}

/// 方法列表
extension PublicAcctManager{
    
}
