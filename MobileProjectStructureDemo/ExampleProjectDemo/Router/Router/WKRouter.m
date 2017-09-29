//
//  WKRouter.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/9/29.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "WKRouter.h"

@implementation WKRouter
static WKRouter *_instance = nil;

+ (instancetype)sharedRouter
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

#pragma mark-lazyload
- (WKKeyWindowMaster*)keyWindowMaster
{
    if (_keyWindowMaster == nil) {
        _keyWindowMaster = [WKKeyWindowMaster new];
    }
    return _keyWindowMaster;
}
@end
