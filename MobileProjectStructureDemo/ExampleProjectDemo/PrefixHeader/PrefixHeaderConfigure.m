//
//  PrefixHeaderConfigure.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/20.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PrefixHeaderConfigure.h"

@implementation PrefixHeaderConfigure

+ (void)load
{
    //    [UIView appearance]
    [UIView appearance].opaque = YES;
    [UINavigationBar appearance].translucent = NO;
    
    //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
}

@end
