//
//  PublicPageCircleSpreadTransformViewModel.h
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：业务模型
 功能描述：页面圆点扩散业务逻辑
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import "PublicPageCircleSpreadTransformDelegate.h"

typedef NS_ENUM(NSUInteger,PublicPageCircleSpreadTransformType) {
    PublicPageCircleSpreadTransformTypePresent = 0,
    PublicPageCircleSpreadTransformTypeDismiss = 1
};

@interface PublicPageCircleSpreadTransformViewModel : NSObject<CAAnimationDelegate,UIViewControllerAnimatedTransitioning>

/**
 跳转方式 present 或 dismiss
 */
@property (nonatomic,assign) PublicPageCircleSpreadTransformType operation;

@end
