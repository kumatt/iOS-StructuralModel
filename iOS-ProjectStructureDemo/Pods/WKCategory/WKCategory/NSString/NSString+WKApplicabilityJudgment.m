//
//  NSString+WKApplicabilityJudgment.m
//  WKCategory
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "NSString+WKApplicabilityJudgment.h"

@implementation NSString (WKApplicabilityJudgment)

#pragma mark-API

- (BOOL)WK_conformToPredicateString:(NSString *)predStr
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    if(([other rangeOfString:self].location != NSNotFound)) return YES;
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predStr];
    return [pred evaluateWithObject:self];//适配九宫格键盘
}

/**
 1.纯数字
 2.纯英文（无特殊字符）
 3.纯中文（无特殊字符）
 4.电话格式
 5.身份证格式
 6.银行卡格式
 7.邮箱地址
 8.数字加英文
 9.数字加中文
 10.英文加中文
 11.数字 英文 中文

 @param type 符合的类型
 @return 是否符合选中类型
 */
- (BOOL)WK_conformToApplicabilityJudgmentType:(WKApplicabilityJudgmentType)type
{
    switch ((NSInteger)type) {
        case WKApplicabilityJudgmentTypeNumberCharacters:
            return [self belongToNumberCharacters];
        case WKApplicabilityJudgmentTypeOrdinaryEnglishCharacters:
            return [self belongToOrdinaryEnglishCharacters];
        case WKApplicabilityJudgmentTypeChineseCharacters:
            return [self belongToChineseCharacters];
        case WKApplicabilityJudgmentTypeMobile:
            return [self belongToMobile];
        case WKApplicabilityJudgmentTypeIDCard:
            return [self belongToIDCard];
        case WKApplicabilityJudgmentTypeBankCard:
            return [self belongToBankCard];
        case WKApplicabilityJudgmentTypeEmail:
            return [self belongToEmail];
        case WKApplicabilityJudgmentTypeNumberCharacters|WKApplicabilityJudgmentTypeOrdinaryEnglishCharacters:
            return [self belongToNumberCharacters]||[self belongToOrdinaryEnglishCharacters];
        case WKApplicabilityJudgmentTypeNumberCharacters|WKApplicabilityJudgmentTypeChineseCharacters:
            return [self belongToNumberCharacters]||[self belongToChineseCharacters];
        case WKApplicabilityJudgmentTypeOrdinaryEnglishCharacters|WKApplicabilityJudgmentTypeChineseCharacters:
            return [self belongToOrdinaryEnglishCharacters]||[self belongToChineseCharacters];
        case WKApplicabilityJudgmentTypeNumberCharacters|WKApplicabilityJudgmentTypeOrdinaryEnglishCharacters|WKApplicabilityJudgmentTypeChineseCharacters:
            return [self belongToNumberCharacters]||[self belongToOrdinaryEnglishCharacters]||[self belongToChineseCharacters];
        default:
            break;
    }
    return YES;
}

- (BOOL)WK_belongsToDecimalDigits:(int)digit
{
    return [self WK_conformToPredicateString:[NSString stringWithFormat:@"(^[1-9][0-9]*[/.]{0,1}[0-9]{0,%d}$)|(^[0][/.][0-9]{0,%d}$)|0",digit,digit]];

}

#pragma mark-subJudge
- (BOOL)belongToNumberCharacters
{
    return [self WK_conformToPredicateString:@"[0-9]*"];
}

- (BOOL)belongToOrdinaryEnglishCharacters
{
    return [self WK_conformToPredicateString:@"[a-zA-Z]*"];
}

- (BOOL)belongToChineseCharacters
{
    return [self WK_conformToPredicateString:@"\u4E00-\u9FA5"];
}

- (BOOL)belongToMobile
{
    return [self WK_conformToPredicateString:@"(^1[34578]{1}[0-9]{9}$)|(^[0][1-9]{2,3}-[0-9]{5,10}$)|(^[1-9]{1}[0-9]{5,8}$)"];
}

- (BOOL)belongToIDCard
{
    NSString *identityString = self;
    if (identityString.length != 18) return NO;
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    if(![identityStringPredicate evaluateWithObject:identityString]) return NO;
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex = [[identityString substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    

    NSInteger idCardMod=idCardWiSum%11;
    NSString *idCardLast= [identityString substringWithRange:NSMakeRange(17, 1)];
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }
    else{
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;

}

- (BOOL)belongToBankCard
{
    if (self.length <15) {
        return NO;
    }
    
    NSString *cardNo = self;
    int oddsum = 0;     
    int evensum = 0;
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1]intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength -1];
    for (int i = cardNoLength -1; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1,1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    return (allsum % 10) == 0;
}

- (BOOL)belongToEmail
{
    return [self WK_conformToPredicateString:@"[A-Z0-9a-z/._%+-]+@[A-Za-z0-9/.-]+\\.[A-Za-z]{2,4}"];
}

@end
