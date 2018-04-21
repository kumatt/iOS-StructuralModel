//
//  NSString+WKEncode.h
//  WKCategory
//
//  Created by admin on 2017/7/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：字符串转换
 --修改人：
 修改时间：
 修改描述：
 */
#import <Foundation/Foundation.h>

@interface NSString (WKEncode)

//--------------dateEncode---------------
/**
 通过时间编码转换成字符串

 @param dataformat 转换格式
 @return 编码后的时间  （例如："YYYY-MM-dd HH:mm:ss"  得到 "2017-07-07 12:23:22"）
 */
- (NSString *_Nonnull)WK_dateEncodeWithDataFormatter:(NSString*_Nonnull)dataformat;

/**
 默认时间编码转字符串 YYYY-MM

 @return 需要的时间字符串
 */
- (NSString *_Nonnull)WK_dateEncode;

/**
 距离现在的时间
 */
- (NSString *_Nonnull)WK_dateCompareCurrentTimeForDate;

//--------------urlEncode---------------

/**
 编码url字符串不成功的问题

 */
- (NSString *_Nonnull)WK_urlEncode;

//--------------encryption---------------

/**
 md5转码

 */
- (NSString *_Nonnull)WK_md5Encode;



@end
