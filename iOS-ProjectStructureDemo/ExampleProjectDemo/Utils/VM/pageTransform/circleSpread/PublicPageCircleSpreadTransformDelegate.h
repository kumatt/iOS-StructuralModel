//
//  PublicPageCircleSpreadTransformDelegate.h
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：协议方法
 功能描述：页面圆点扩散协议
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@protocol PublicPageCircleSpreadTransformDelegate <NSObject>

/**
 获取扩散小圆点

 @return 小圆点
 */
- (UIView*_Nonnull)CircleSpreadTransform_getCircleView;

@end
