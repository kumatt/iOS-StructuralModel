//
//  AppControlModel.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "AppControlModel.h"
#import <UIKit/UIKit.h>

@interface AppControlModel ()

@end
@implementation AppControlModel
static AppControlModel *_instance = nil;

+ (instancetype)sharedAppControlModel
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
        [self creatInitData];
    }
    return self;
}

- (void)creatInitData
{
    [self creatRootControllerConfigurationModel];
}

#pragma mark-dataInit

/**
 创建根控制器配置模型
 */
- (void)creatRootControllerConfigurationModel
{
    NSString *localPath = [[NSBundle mainBundle]pathForResource:@"RootControllerConfiguration" ofType:@"plist"];
    NSArray *localData  = [NSArray arrayWithContentsOfFile:localPath];
    NSArray<NSString*> *classArray = @[@"BaseHomeViewController",@"BaseCarViewController",@"BaseFinaceViewController",@"BaseAcctViewController"];
    NSMutableArray *dataArray = [NSMutableArray new];
    _feedRootControllerEntity = dataArray;
    
    if (localData == nil || [localData isKindOfClass:[NSArray class]] == NO) {
        localData = [NSArray new];
    }
    [classArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RootKeyWindowDataModel *model = [RootKeyWindowDataModel new];
        if (idx < localData.count) {
            NSDictionary *dict = localData[idx];
            if ([dict isKindOfClass:[NSDictionary class]]) {
                [model setValuesForKeysWithDictionary:dict];
            }
        }
        model.class_name = obj;
        [dataArray addObject:model];
    }];
}

#pragma mark-app_data
- (void)setTabBarHidden:(BOOL)tabBarHidden
{
    if (_tabBarHidden == tabBarHidden) {
        return;
    }
    _tabBarHidden = tabBarHidden;
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (![vc isKindOfClass:[UITabBarController class]]) {
        return;
    }
    UITabBarController *tabVc = (id)vc;
    tabBarHidden?[self hideTabBar:tabVc]:[self showTabBar:tabVc];
}

- (void)hideTabBar:(UITabBarController *)tabbarcontroller
{
    // 隐藏tabbar
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        tabbarcontroller.tabBar.frame = CGRectMake(0, CUSTOM_SCREEN_HEIGHT, CUSTOM_SCREEN_WIDTH, 49);
    }];
}

- (void)showTabBar:(UITabBarController *)tabbarcontroller
{
    // 显示tabbar
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        tabbarcontroller.tabBar.frame = CGRectMake(0, CUSTOM_SCREEN_HEIGHT-49, CUSTOM_SCREEN_WIDTH, 49);
    }];
}

@end
