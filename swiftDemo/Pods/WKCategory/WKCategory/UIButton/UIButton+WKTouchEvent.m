//
//  UIButton+WKTouchEvent.m
//  WKCategory
//
//  Created by admin on 2017/8/10.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "UIButton+WKTouchEvent.h"

@implementation UIButton (WKTouchEvent)

/**
 当前点击是否有效

 @param point 点击位置
 @param event 交互
 */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    [super pointInside:point withEvent:event];
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

@end
