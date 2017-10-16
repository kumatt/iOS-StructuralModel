//
//  BaseBarItemViewController.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "BaseBarItemViewController.h"

@interface BaseBarItemViewController ()

@end

@implementation BaseBarItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 push的时候隐藏分栏按钮窗口
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        [CUSTOM_APP_DEFAULT_CONTROLMODEL.master_keyWindow hiddenTabBar];
    }else {
        [CUSTOM_APP_DEFAULT_CONTROLMODEL.master_keyWindow showTabBar];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [CUSTOM_APP_DEFAULT_CONTROLMODEL.master_keyWindow showTabBar];
    
}

@end
