//
//  BaseTransformCircleSpreadViewIndex.h
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：容器
 功能描述：圆点扩散页显示层索引
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface BaseTransformCircleSpreadViewIndex : NSObject

/**
 显示层容器
 */
@property (nonnull,nonatomic,strong) UIView *container;
//=============================subView======================================

/**
 背景图片
 */
@property (nonnull,nonatomic,strong) UIImageView *imageView_back;

/**
 跳转按钮
 */
@property (nonnull,nonatomic,strong) UIButton *button_present;

@end
