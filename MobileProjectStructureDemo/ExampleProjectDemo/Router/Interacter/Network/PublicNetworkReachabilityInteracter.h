//
//  PublicNetworkReachabilityInteracter.h
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/24.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 功能描述：关于网络状态的监听
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface PublicNetworkReachabilityInteracter : NSObject

/**
 网络状态切换
 */
@property (nonatomic,assign) AFNetworkReachabilityStatus networkReachabilityStatus;

/**
 网络状态正常
 */
@property (nonatomic,assign) BOOL networkVisiable;

@end
