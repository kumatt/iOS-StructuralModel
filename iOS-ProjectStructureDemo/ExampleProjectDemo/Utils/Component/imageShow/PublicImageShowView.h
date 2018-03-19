//
//  PublicImageShowView.h
//  jyhf
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 功能描述：图片展示(旧架构)
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <UIKit/UIKit.h>

@interface PublicImageShowView : UIView

/**
 通过数据源 初始选择位置 滑动block来展示

 @param dataSource 数据源
 @param idx 初始选择位置
 @param itemDidScrollOperationBlock 滑动位置block
 */
+ (void)Show_imageScrollWithDataArray:(NSArray*_Nonnull)dataSource SelectAt:(NSUInteger)idx ItemDidScrollOperationBlock: (void(^_Nullable)(NSInteger currentIndex))itemDidScrollOperationBlock;

@end
