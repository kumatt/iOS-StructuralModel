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
    
    [self theChildControllerAdd];
}

/**
 加载子控制器
 */
- (void)theChildControllerAdd
{
    [CUSTOM_APP_DEFAULT_CONTROLMODEL.feedRootControllerEntity enumerateObjectsUsingBlock:^(RootKeyWindowDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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

@end
