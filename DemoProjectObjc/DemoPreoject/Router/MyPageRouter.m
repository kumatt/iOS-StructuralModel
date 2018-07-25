//
//  MyPageRouter.m
//  DemoPreoject
//
//  Created by Mac on 2018/7/25.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "MyPageRouter.h"

@implementation MyPageRouter

- (NSString *)pt_getPageFormPath
{
    return [[NSBundle mainBundle]pathForResource:@"RouterForm" ofType:@"plist"];
}

@end
