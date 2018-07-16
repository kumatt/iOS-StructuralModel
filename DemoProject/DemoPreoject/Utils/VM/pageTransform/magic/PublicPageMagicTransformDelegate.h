//
//  PublicPageMagicTransformDelegate.h
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：协议方法
 功能描述：页面神奇跳转协议
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PublicPageMagicTransformDelegate <NSObject>

@optional
/**
 获取用来展示效果的视图  fromView
 
 @return 目标视图
 */
- (UIView*_Nonnull)magicTransform_getFromView;

/**
 获取用来展示效果的视图  ToView
 
 @return 目标视图
 */
- (UIView*_Nonnull)magicTransform_getToView;


@end
