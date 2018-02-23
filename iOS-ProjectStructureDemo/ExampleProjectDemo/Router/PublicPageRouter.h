//
//  PublicPageRouter.h
//  PT-PageRouterDemo
//
//  Created by admin on 2017/12/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PTPublicPageRouter.h>

typedef NSString PublicPageRouterType;


#pragma mark-testModule
///测试模块首页
static NSString *const _Nullable PublicPageRouterModuleTest          =\
                                @"BaseHomeViewController&TestModule/home";

#pragma mark-testModule
///跳转详情
static NSString *const _Nullable PublicPageRouterModuleTransformDetail          =\
                                @"BaseTransformDetailViewController&TransformModule/detail";

///神奇跳转列表
static NSString *const _Nullable PublicPageRouterModuleTransformMagic          =\
                                @"BaseTransformMagicViewController&TransformModule/magic";

///圆点扩散跳转
static NSString *const _Nullable PublicPageRouterModuleTransformCircleSpread          =\
                                @"BaseTransformCircleSpreadViewController&TransformModule/circleSpread";


@interface PublicPageRouter : NSObject

/**
 跳转目标控制器
 
 @param modalType 类名+数据路径
 @param entity 配置参数
 @param animated 是否显示跳转动画
 */
+ (void)OpenUrlWithModalType:(PublicPageRouterType*_Nonnull)modalType DataEntity:(NSDictionary*_Nullable)entity Animated:(BOOL)animated;

/**
 跳转目标控制器
 
 @param modalType 类名+数据路径
 @param entity 配置参数
 @param animated 是否显示跳转动画
 */
+ (void)OpenUrlWithModalType:(PublicPageRouterType*_Nonnull)modalType DataEntity:(NSDictionary*_Nullable)entity Animated:(BOOL)animated Completion:(void (^ __nullable)(UIViewController* _Nullable toViewController))completion;

@end
