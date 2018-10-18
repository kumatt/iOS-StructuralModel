//
//  RootViewController.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "RootViewController.h"
#import "RootKeyWindowDataModel.h"

#import <Aspects.h>

@interface RootViewController ()

/**
 tabBar的是否隐藏
 */
@property (nonatomic,assign) BOOL bool_tabBarHidden;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    [self add_childController];
}

/**
 加载子控制器
 */
- (void)add_childController
{
    [[self get_RootControllerConfigurationModel] enumerateObjectsUsingBlock:^(RootKeyWindowDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *viewController = [[NSClassFromString(obj.name)alloc]init];
        UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:viewController];
        naVC.title = obj.title;
        viewController.title = obj.title;
        viewController.hidesBottomBarWhenPushed = NO;
        
        naVC.tabBarItem.image = [[UIImage imageNamed:obj.normalImage_name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        naVC.tabBarItem.selectedImage = [[UIImage imageNamed:obj.selectImage_name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [naVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : CUSTOM_COLOR_HEX(0x666666)} forState:UIControlStateNormal];
        [naVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : CUSTOM_COLOR_HEX(0x59337b)} forState:UIControlStateSelected];
        
        [self addChildViewController:naVC];
    }];
}

#pragma mark-get
/**
 创建根控制器配置模型
 */
- (NSArray*)get_RootControllerConfigurationModel
{
    NSString *localPath = [[NSBundle mainBundle]pathForResource:@"BarConfigure" ofType:@"plist"];
    NSArray *localData  = [NSArray arrayWithContentsOfFile:localPath];
    NSMutableArray *dataArray = [NSMutableArray new];
    
    if (localData == nil || [localData isKindOfClass:[NSArray class]] == NO) {
        localData = [NSArray new];
    }
    
    for (NSInteger idx = 0; idx < localData.count; idx ++) {
        RootKeyWindowDataModel *model = [RootKeyWindowDataModel new];
        if (idx < localData.count) {
            NSDictionary *dict = localData[idx];
            if ([dict isKindOfClass:[NSDictionary class]]) {
                [model yy_modelSetWithDictionary:dict];
            }
        }
        [dataArray addObject:model];
    }
    
    return dataArray;
}


@end
