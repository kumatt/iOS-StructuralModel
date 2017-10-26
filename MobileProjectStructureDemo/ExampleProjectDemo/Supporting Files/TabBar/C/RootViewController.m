//
//  RootViewController.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "RootViewController.h"
#import "RootKeyWindowDataModel.h"

@interface RootViewController ()

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
        UIViewController *viewController = [[NSClassFromString(obj.class_name)alloc]init];
        UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:viewController];
        naVC.title = obj.title;
        viewController.title = obj.title;
        
        naVC.tabBarItem.image = [[UIImage imageNamed:obj.normalImage_name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        naVC.tabBarItem.selectedImage = [[UIImage imageNamed:obj.selectImage_name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [naVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : CUSTOM_COLOR_HEX(0x666666)} forState:UIControlStateNormal];
        if (idx == 2) {
            [naVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : CUSTOM_COLOR_HEX(0xc38521)} forState:UIControlStateSelected];
        }else{
            [naVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : CUSTOM_COLOR_HEX(0x59337b)} forState:UIControlStateSelected];
        }
        
        [self addChildViewController:naVC];
    }];
}

#pragma mark-get
/**
 创建根控制器配置模型
 */
- (NSArray*)get_RootControllerConfigurationModel
{
    NSString *localPath = [[NSBundle mainBundle]pathForResource:@"RootControllerConfiguration" ofType:@"plist"];
    NSArray *localData  = [NSArray arrayWithContentsOfFile:localPath];
    NSArray<NSString*> *classArray = @[@"BaseHomeViewController",@"BaseCarViewController",@"BaseFinaceViewController",@"BaseAcctViewController"];
    NSMutableArray *dataArray = [NSMutableArray new];
    
    if (localData == nil || [localData isKindOfClass:[NSArray class]] == NO) {
        localData = [NSArray new];
    }
    
    for (NSInteger idx = 0; idx < classArray.count; idx ++) {
        RootKeyWindowDataModel *model = [RootKeyWindowDataModel new];
        if (idx < localData.count) {
            NSDictionary *dict = localData[idx];
            if ([dict isKindOfClass:[NSDictionary class]]) {
                [model setValuesForKeysWithDictionary:dict];
            }
        }
        model.class_name = classArray[idx];
        [dataArray addObject:model];
    }
    
    return dataArray;
}

@end
