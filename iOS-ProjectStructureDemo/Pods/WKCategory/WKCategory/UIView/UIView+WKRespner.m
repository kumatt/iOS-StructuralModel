//
//  UIView+WKRespner.m
//  WKCategory
//
//  Created by admin on 2017/8/4.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "UIView+WKRespner.h"

@implementation UIView (WKRespner)

- (UIViewController *)wk_controller
{
    return [self controllerForView:self];
}

- (UIViewController*)controllerForView:(UIView*)view
{
    id nextResponse = view.nextResponder;
    if (nextResponse == nil) {
        return nil;
    }
    if ([nextResponse isKindOfClass:[UIViewController class]]) {
        return nextResponse;
    }else{
        return [self controllerForView:nextResponse];
    }
}

@end
