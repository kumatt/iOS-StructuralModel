//
//  PrefixHeaderConfigure.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/20.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PrefixHeaderConfigure.h"
#import <UIKit/UIKit.h>
#import <Aspects.h>

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
    //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
    
    [UINavigationBar appearance].translucent = NO;
    //自定义返回按钮
    UIImage *resultImage = [UIImage imageNamed:@"return"];
    [[UINavigationBar appearance] setBackIndicatorImage:resultImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:resultImage];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:42/255.0 green:42/255.0 blue:42/255.0 alpha:1]];
    //    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-CGFLOAT_MAX, 0) forBarMetrics:UIBarMetricsDefault];
}

/**
 放置钩子
 */
+ (void)init_setHookSelector
{
    if (@available(iOS 11, *)) {
        return ;
    }
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        UIViewController *vc = aspectInfo.instance;
        vc.automaticallyAdjustsScrollViewInsets = NO;
    } error:nil];
    
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionInstead usingBlock:(NSNumber*)^(id<AspectInfo> aspectInfo){
        return @(UIInterfaceOrientationMaskAllButUpsideDown);
    } error:nil];
    [UIViewController aspect_hookSelector:@selector(shouldAutorotate) withOptions:AspectPositionInstead usingBlock:(NSNumber*)^(id<AspectInfo> aspectInfo){
        return @(NO);
    } error:nil];
}

@end
