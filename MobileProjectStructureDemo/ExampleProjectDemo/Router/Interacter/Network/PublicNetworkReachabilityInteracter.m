//
//  PublicNetworkReachabilityInteracter.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/24.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicNetworkReachabilityInteracter.h"

@implementation PublicNetworkReachabilityInteracter
- (instancetype)init
{
    if (self = [super init]) {
        self.networkReachabilityStatus = AFNetworkReachabilityStatusUnknown;
        self.networkVisiable = NO;
        [self theReachabilityObserve];
    }
    return self;
}

/**
 *  网络监控
 */
- (void)theReachabilityObserve
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        self.networkReachabilityStatus = status;
        self.networkVisiable = (status > 0);
    }];
    // 3.开始监控
    [mgr startMonitoring];
}

@end
