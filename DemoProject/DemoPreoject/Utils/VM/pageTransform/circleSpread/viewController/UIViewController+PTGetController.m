
//
//  UIViewController+PTGetController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "UIViewController+PTGetController.h"

@implementation UIViewController (PTGetController)

#pragma mark-getViewController
- (UIViewController*)pt_lastViewController
{
    return [self _lastViewController:self];
}

- (UIViewController *)_lastViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _lastViewController:[(UINavigationController *)vc topViewController]];
    }
    if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _lastViewController:[(UITabBarController *)vc selectedViewController]];
    }
    return vc;
}

@end
