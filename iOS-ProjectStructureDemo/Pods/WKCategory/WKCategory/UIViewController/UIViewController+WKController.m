//
//  UIViewController+WKController.m
//  WKCategoryDemo
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "UIViewController+WKController.h"

@implementation UIViewController (WKController)

+ (instancetype)WK_CurrentViewController {
    UIViewController *resultVC;
    resultVC = [self _currentViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _currentViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_currentViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _currentViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _currentViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


@end
