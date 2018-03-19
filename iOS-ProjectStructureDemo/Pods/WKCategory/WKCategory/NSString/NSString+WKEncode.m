//
//  NSString+WKEncode.m
//  WKCategory
//
//  Created by admin on 2017/7/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "NSString+WKEncode.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (WKEncode)

#pragma mark-dateEncode
- (NSString *)WK_dateEncode
{
    return [self WK_dateEncodeWithDataFormatter:@"YYYY/MM"];
}

- (NSString *)WK_dateEncodeWithDataFormatter:(NSString *)dataformat
{
    NSInteger num = [self integerValue];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:dataformat];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:num];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

- (NSString *)WK_dateCompareCurrentTimeForDate
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.integerValue];
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
        
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return result;
}

#pragma mark-urlEncode
- (NSString *)WK_urlEncode
{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    unsigned long int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

#pragma mark-encryption
- (NSString *)WK_md5Encode
{
    const char *concat_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(concat_str, (unsigned int)strlen(concat_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i =0; i <16; i++){
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash uppercaseString];
}


@end
