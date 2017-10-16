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

#pragma mark-lazyload
- (PublicKeyWindowMaster *)master_keyWindow
{
    if (_master_keyWindow == nil) {
        _master_keyWindow = [PublicKeyWindowMaster new];
    }
    return _master_keyWindow;
}
@end
