//
//  NSString+WKApplicabilityJudgment.h
//  WKCategory
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：字符串适用性判断
 --修改人：
 修改时间：
 修改描述：
 */
;
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,WKApplicabilityJudgmentType){
    ///数字
    WKApplicabilityJudgmentTypeNumberCharacters             = 1,
    ///英文
    WKApplicabilityJudgmentTypeOrdinaryEnglishCharacters    = 1 << 1,
    ///中文
    WKApplicabilityJudgmentTypeChineseCharacters            = 1 << 2,
    ///电话
    WKApplicabilityJudgmentTypeMobile               = 1 << 3,
    ///身份证
    WKApplicabilityJudgmentTypeIDCard               = 1 << 4,
    ///银行卡
    WKApplicabilityJudgmentTypeBankCard             = 1 << 5,
    ///邮箱
    WKApplicabilityJudgmentTypeEmail             = 1 << 6,

};
@interface NSString (WKApplicabilityJudgment)

/**
 是否符合正则表达式
 @param predStr 正则公式
 */
- (BOOL)WK_conformToPredicateString:(NSString*)predStr;

/**
 符合选定标准
 
 @param type 类型
 */
- (BOOL)WK_conformToApplicabilityJudgmentType:(WKApplicabilityJudgmentType)type;

/**
 保留小数位数几位

 @param digit 位数
 @return 是否符合标准
 */
- (BOOL)WK_belongsToDecimalDigits:(int)digit;

@end
