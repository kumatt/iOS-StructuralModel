//
//  NSObject+WKApplicationInfo.h
//  WKCategory
//
//  Created by admin on 2017/7/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：app信息
 --修改人：
 修改时间：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface NSObject (WKApplicationInfo)

/**
 随机UUID
 
 */
+ (NSString*)WK_arcdomUUID;


/**
 获取手机型号
 
 */
+ (NSString *)WK_getDeviceInfo;

@end
