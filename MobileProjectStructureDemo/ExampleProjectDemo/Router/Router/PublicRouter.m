//
//  PublicRouter.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicRouter.h"

@implementation PublicRouter
static PublicRouter *_instance = nil;

+ (instancetype)sharedRouter
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self loadNetworkReachability];
    }
    return self;
}

#pragma mark-initload
- (void)loadNetworkReachability
{
    _interacter_networkReachability = [PublicNetworkReachabilityInteracter new];
}

#pragma mark-lazyload
- (PublicKeyWindowInteracter *)interacter_keyWindow
{
    if (_interacter_keyWindow == nil) {
        _interacter_keyWindow = [PublicKeyWindowInteracter new];
    }
    return _interacter_keyWindow;
}
@end
