//
//  UIImage+WKImageInfo.h
//  WKCategory
//
//  Created by admin on 2017/7/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：图片信息
 --修改人：
 修改时间：
 修改描述：
 */
#import <UIKit/UIKit.h>

@interface UIImage (WKImageInfo)


/**
 判断图片类型
 通过图片Data数据第一个字节 来获取图片扩展名
 */
- (NSString *)WK_contentTypeForImage;

/**
 取图片某一点的颜色

 @param point 点的位置
 */
- (UIColor *)WK_colorWithPoint:(CGPoint)point;

/**
 判断该图片是否有透明度通道

 */
- (BOOL)WK_hasAlphaChannel;

@end
