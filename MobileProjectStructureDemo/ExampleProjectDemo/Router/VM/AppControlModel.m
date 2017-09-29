//
//  AppControlModel.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "AppControlModel.h"
#import <UIKit/UIKit.h>

@interface AppControlModel ()

@end
@implementation AppControlModel
static AppControlModel *_instance = nil;

+ (instancetype)sharedAppControlModel
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}


#pragma mark-app_data
- (void)setTabBarHidden:(BOOL)tabBarHidden
{
    if (_tabBarHidden == tabBarHidden) {
        return;
    }
    _tabBarHidden = tabBarHidden;
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (![vc isKindOfClass:[UITabBarController class]]) {
        return;
    }
    UITabBarController *tabVc = (id)vc;
    tabBarHidden?[self hideTabBar:tabVc]:[self showTabBar:tabVc];
}

- (void)hideTabBar:(UITabBarController *)tabbarcontroller
{
    // 隐藏tabbar
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        tabbarcontroller.tabBar.frame = CGRectMake(0, CUSTOM_SCREEN_HEIGHT, CUSTOM_SCREEN_WIDTH, 49);
    }];
}

- (void)showTabBar:(UITabBarController *)tabbarcontroller
{
    // 显示tabbar
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        tabbarcontroller.tabBar.frame = CGRectMake(0, CUSTOM_SCREEN_HEIGHT-49, CUSTOM_SCREEN_WIDTH, 49);
    }];
}

@end
