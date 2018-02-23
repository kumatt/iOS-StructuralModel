//
//  BaseTransformDetailViewIndex.h
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//
/*
 创建人：OComme
 架构层级：容器
 功能描述： 显示层索引
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface BaseTransformDetailViewIndex : NSObject

/**
 视图容器
 */
@property (nonnull,nonatomic,strong) UIView *container;
//=============================subView======================================

/**
 占位滑动层
 */
@property (nonnull,nonatomic,strong) UIScrollView *contentView;

/**
 主图
 */
@property (nonnull,nonatomic,strong) UIImageView *imageView_head;

/**
 标题文本
 */
@property (nonnull,nonatomic,strong) UILabel *label_title;

/**
 介绍文本
 */
@property (nonnull,nonatomic,strong) UILabel *label_introduce;

/**
 返回按钮
 */
@property (nonnull,nonatomic,strong) UIButton *button_back;

/**
 添加返回按钮
 */
- (void)layout_addBackButton;

@end
