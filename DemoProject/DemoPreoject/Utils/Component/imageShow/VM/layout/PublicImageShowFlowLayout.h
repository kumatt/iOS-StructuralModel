//
//  PublicImageShowFlowLayout.h
//  jyhf
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：业务模型
 功能描述：图片展示的初始偏移位置
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <UIKit/UIKit.h>

@interface PublicImageShowFlowLayout : UICollectionViewFlowLayout

/**
 初始选择位置
 */
@property (nonatomic,assign) CGPoint contentOffset;

@end
