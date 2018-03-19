//
//  UIImage+WKGetImage.h
//  WKCategory
//
//  Created by admin on 2017/7/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：获取图片
 --修改人：
 修改时间：
 修改描述：
 */
#import <UIKit/UIKit.h>

@interface UIImage (WKGetImage)


/**
 颜色转图片

 @param color 条件颜色
 @return 图片
 */
+ (UIImage *)WK_imageWithColor:(UIColor *)color;


//--------------get form current image --------------
/**
 image圆角

 */
- (UIImage *)WK_circleImage;


/**
 image拉伸

 */
- (UIImage *)WK_resizableImage;

/**
 获得灰度图

 */
- (UIImage*)WK_covertToGrayImage;


/**
 设置UIImage的透明度

 @param alpha 透明度
 @return 图片
 */
- (UIImage *)WK_imageByApplyingAlpha:(CGFloat) alpha;

/**
 压缩图片

 */
-(UIImage *)WK_resizeImage;

@end
