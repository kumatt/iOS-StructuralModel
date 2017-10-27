//
//  PrefixHeaderConfigure.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/20.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PrefixHeaderConfigure.h"
#import <Aspects.h>
#import <UIKit/UIKit.h>

#import "ExampleAppDelegate.h"

@implementation PrefixHeaderConfigure

+ (void)load
{
    [self init_setUIConfigure];
    [self init_setHookSelector];
}

#pragma mark-init
/**
 初始配置
 */
+ (void)init_setUIConfigure
{
    //    [UIView appearance].opaque = YES;
    [UINavigationBar appearance].translucent = NO;
    
    //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
}

/**
 放置钩子
 */
+ (void)init_setHookSelector
{
    @weakify(self);
    [UIResponder aspect_hookSelector:@selector(init) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        if (![aspectInfo.instance conformsToProtocol:@protocol(UIApplicationDelegate)]) {
            return ;
        }
        @strongify(self);
        [self hook_ApplicationdelegateWithDelegate:aspectInfo.instance];
    } error:nil];
}

#pragma mark-hook
+ (void)hook_ApplicationdelegateWithDelegate:(UIResponder*)delegate
{
    @weakify(self);
    [delegate aspect_hookSelector:@selector(application:didFinishLaunchingWithOptions:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo,NSDictionary *launchOptions){
        @strongify(self);
        [self applicationDidFinishLaunchingWithOptions:launchOptions];
    } error:nil];
    
    [delegate aspect_hookSelector:@selector(applicationWillTerminate:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo,NSDictionary *launchOptions){
        @strongify(self);
        [self applicationDidFinishLaunchingWithOptions:launchOptions];
    } error:nil];
}

#pragma mark-appdele
+ (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
}


+ (void)applicationWillTerminate:(UIApplication *)application {

}

@end
