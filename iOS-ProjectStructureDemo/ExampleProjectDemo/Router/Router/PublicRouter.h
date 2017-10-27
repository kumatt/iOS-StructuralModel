//
//  PublicRouter.h
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 功能描述：app的业务交换器
 所处位置：app->router
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import "PublicKeyWindowInteracter.h"
#import "PublicNetworkReachabilityInteracter.h"

///控制模型
#define CUSTOM_APP_DEFAULT_CONTROLMODEL [PublicRouter sharedRouter]
@interface PublicRouter : NSObject

+ (instancetype _Nonnull)sharedRouter;

/**
 主窗口相关
 */
@property (nonnull,nonatomic,strong) PublicKeyWindowInteracter *interacter_keyWindow;

/**
 网络数据状态相关业务
 */
@property (nonnull,nonatomic,strong) PublicNetworkReachabilityInteracter *interacter_networkReachability;

@end
