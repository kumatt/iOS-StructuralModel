//
//  UIView+WKRespner.h
//  WKCategory
//
//  Created by admin on 2017/8/4.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：视图类的响应链相关拓展
 --修改人：
 修改时间：
 修改描述：
 */
#import <UIKit/UIKit.h>

@interface UIView (WKRespner)

/**
 视图类的控制器
 */
@property (nonnull,nonatomic,strong,readonly) UIViewController *wk_controller;

@end
