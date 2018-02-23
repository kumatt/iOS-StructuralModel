//
//  PTPublicPageRouter.h
//  PT-PrefixHeaderDemo
//
//  Created by BlanBok on 2017/12/17.
//  Copyright © 2017年 OComme. All rights reserved.
//
/*
 创建人：OComme
 架构层级：业务组件
 功能描述：页面间的跳转
 所处位置：
 创建版本：V 0.1
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//==================================notification===========================================
///页面跳转通知  object为控制器实例  infodict为介绍内容
static NSString * _Nullable const PTPublicPageRouterNotification    = @"_pageRouter_notice";

//==================================entity key===========================================
///介绍信息
static NSString * _Nullable const PTPublicPageRouterKeyDescrip      = @"_descrip";
///必填项
static NSString * _Nullable const PTPublicPageRouterKeyRequire      = @"_require";
///选填项
static NSString * _Nullable const PTPublicPageRouterKeyOption       = @"_option";

//==================================configure key===========================================
///目标路径
static NSString * _Nullable const PTPublicPageRouterKeyPath         = @"_keyPath";
///控制器类名
static NSString * _Nullable const PTPublicPageRouterKeyClass        = @"_className";
/////跳转方式
//static NSString * _Nullable const PTPublicPageRouterKeyConversType  = @"_conversType";
/*
 example Dict
 <dict>
 
 <!--介绍信息-->
 <key>_descrip</key>
 <string>关于页面的介绍</string>
 
 <!--必填参数-->
 <key>_require</key>
 <dict>
 <key>key</key>
 <string>关于“key”的介绍</string>
 </dict>
 
 <!--选填参数-->
 <key>_option</key>
 <dict>
 <key>key</key>
 <string>关于“key”的介绍</string>
 </dict>
 </dict>
 */

@protocol PTPublicPageRouterDelegate <NSObject>

/**
 配置基本数据
 
 @param dict 字典
 */
- (void)router_setParamentDict:(NSDictionary*_Nonnull)dict;

@end

@interface PTPublicPageRouter : NSObject

/**
 打开路径
 
 @param url 传入路径
 */

/**
 通过本地路径实现跳转
 
 @param url 传入路径
 @param formData 附加数据
 @param animated 是否显示跳转动画
 */
+ (void)OpenUrl:(NSURL*_Nonnull)url FormData:(NSDictionary*_Nullable)formData  Animated:(BOOL)animated;

/**
 通过本地路径实现跳转
 
 @param url 传入路径
 @param formData 附加数据
 @param animated 是否显示跳转动画
 @param completion 跳转回调
 */
+ (void)OpenUrl:(NSURL*_Nonnull)url FormData:(NSDictionary*_Nullable)formData  Animated:(BOOL)animated Completion:(void (^ __nullable)(UIViewController* _Nullable toViewController))completion;

@end
