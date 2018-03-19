//
//  NSArray+WKMap.h
//  WKCategoryDemo
//
//  Created by admin on 2017/10/9.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 功能描述：为Array添加map方法
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface NSArray (WKMap)

- (NSArray *)wkMap:(id (^)(id object))block;

@end
