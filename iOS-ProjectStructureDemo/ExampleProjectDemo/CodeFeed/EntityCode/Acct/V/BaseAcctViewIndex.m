//
//  BaseAcctViewIndex.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/1/17.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseAcctViewIndex.h"

@implementation BaseAcctViewIndex

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self subView_load];
    }
    return self;
}

- (void)setContainer:(UIView *)container
{
    _container = container;
    
    [self subView_layout];
}

#pragma mark-subView
- (void)subView_load
{
    
}

- (void)subView_layout
{
    
}
#pragma mark-loadSubView

@end
