//
//  AppControlModel.h
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：admin
 创建版本：V 1.0.0
 功能描述：APP创建模型
 所处位置：APP->controlModel
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import "RootKeyWindowDataModel.h"

///控制模型
#define CUSTOM_APP_DEFAULT_CONTROLMODEL [AppControlModel sharedAppControlModel]

@interface AppControlModel : NSObject

+ (instancetype _Nonnull)sharedAppControlModel;

#pragma mark-app_data
/**
 分栏框 显示与否
 */
@property (nonatomic,assign) BOOL tabBarHidden;

@end
