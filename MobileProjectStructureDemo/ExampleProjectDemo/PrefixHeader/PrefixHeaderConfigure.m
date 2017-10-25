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
    [self setHookSelector];
}

#pragma mark-initConfigure
+ (void)setInitConfigure
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

#pragma mark-hook
+ (void)setHookSelector
{
    @weakify(self);
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo) {
        UIViewController *vc = aspectInfo.instance;
        if (vc.navigationController == nil || vc.navigationController.viewControllers.count <= 1) {
            return ;
        }
        @strongify(self);
        [self addViewControllerLeftItemWithTarget:vc];
    }  error:nil];
    
    [UIResponder aspect_hookSelector:@selector(init) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        if ([aspectInfo.instance conformsToProtocol:@protocol(UIApplicationDelegate)]) {
            @strongify(self);
            [self hookAppDelegate:aspectInfo.instance];
        }
    } error:nil];
}

+ (void)hookAppDelegate:(UIResponder<UIApplicationDelegate>*)responer
{
    @weakify(self);
    [responer aspect_hookSelector:@selector(application:didFinishLaunchingWithOptions:) withOptions:AspectPositionAfter usingBlock:^(){
        @strongify(self);
        [self setInitConfigure];
        
    } error:nil];
}

+ (void)addViewControllerLeftItemWithTarget:(UIViewController*)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [button setTitle:vc.navigationController.viewControllers[vc.navigationController.viewControllers.count-2].title forState:UIControlStateNormal];
    [button sizeToFit];
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
