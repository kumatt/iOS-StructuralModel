//
//  PublicPageMagicTransformViewModel.h
//  jNewsUI
//
//  Created by BlanBok on 2018/2/8.
//  Copyright © 2018年 juyuancf. All rights reserved.
//
/*
 创建人：OComme
 架构层级：业务模型
 功能描述：页面神奇跳转业务逻辑
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import "PublicPageMagicTransformDelegate.h"


@interface PublicPageMagicTransformViewModel : NSObject<UIViewControllerAnimatedTransitioning>

/**
 跳转方式 pop 或 push
 */
@property (nonatomic,assign) UINavigationControllerOperation operation;

@end
