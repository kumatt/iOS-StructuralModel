//
//  WKKeyWindowMaster.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/9/29.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "WKKeyWindowMaster.h"
#import <UIKit/UIKit.h>

@interface WKKeyWindowMaster()
/**
 tabBar的是否隐藏
 */
@property (nonatomic,assign) BOOL tabBarHidden;

/**
 app根视图
 */
@property (nullable,nonatomic,weak) UITabBarController *rootController;

@end

@implementation WKKeyWindowMaster

#pragma mark-app_data
- (BOOL)canEditTabBarHidden:(BOOL)tabBarHidden
{
    if (_tabBarHidden == tabBarHidden) {
        return NO;
    }
    _tabBarHidden = tabBarHidden;
    if (![self.rootController isKindOfClass:[UITabBarController class]]) {
        return NO;
    }
    return YES;
}

- (void)showTabBar
{
    if ([self canEditTabBarHidden:NO]) {
        return;
    }
    
    // 显示tabbar
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        self.rootController.tabBar.frame = CGRectMake(0, CUSTOM_SCREEN_HEIGHT-49, CUSTOM_SCREEN_WIDTH, 49);
    }];
}

- (void)hiddenTabBar
{
    if ([self canEditTabBarHidden:YES]) {
        return;
    }
    // 隐藏tabbar
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        self.rootController.tabBar.frame = CGRectMake(0, CUSTOM_SCREEN_HEIGHT, CUSTOM_SCREEN_WIDTH, 49);
    }];
}

#pragma mark-lazyload
- (UITabBarController *)rootController
{
    if (_rootController == nil) {
        _rootController = (id)[UIApplication sharedApplication].keyWindow.rootViewController;
    }
    return _rootController;
}
@end
