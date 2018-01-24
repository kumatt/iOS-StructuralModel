//
//  PublicLocalHost.h
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/1/24.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：业务模型
 功能描述：数据请求模拟块
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface PublicLocalHost : NSObject

/**
 获取测试数据（某一项）
 
 @param paraments 参数
 @param completion 回调
 */
+ (void)Fetch_TestDataWithParaments:(NSDictionary*_Nonnull)paraments completion:(void (^ __nullable)(NSDictionary*_Nonnull responseObject))completion;

@end
