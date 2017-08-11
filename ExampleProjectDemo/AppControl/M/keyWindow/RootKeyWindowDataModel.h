//
//  RootKeyWindowDataModel.h
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：admin
 创建版本：V 1.0.0
 功能描述：根控制器的数据模型
 所处位置：APP->keyWindow->RootViewController->dataModel
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface RootKeyWindowDataModel : NSObject

/**
 标题
 */
@property (nonnull,nonatomic,copy) NSString*title;

/**
 类名
 */
@property (nonnull,nonatomic,copy) NSString *class_name;

/**
 普通状态的图片名
 */
@property (nonnull,nonatomic,copy) NSString *normalImage_name;

/**
 选择状态的图片名
 */
@property (nonnull,nonatomic,copy) NSString *selectImage_name;

@end
