//
//  NSObject+WKDataDeal.m
//  WKDataManager
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "NSObject+WKDataDeal.h"

@implementation NSObject (WKDataDeal)

- (id)wk_replaceNullData
{
    return [self replaceNullData:self];
}
    
    ///主要调用该方法
- (id)replaceNullData:(id)obj {
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [self replaceNullWithDictionary:obj];
    }
    else if ([obj isKindOfClass:[NSArray class]]) {
        return [self replaceNullWithArray:obj];
    }
    else if ([obj isKindOfClass:[NSNull class]] || obj == nil) {
        return @"";
    }
    return obj;
}
    
    ///处理字典
- (id)replaceNullWithDictionary:(NSMutableDictionary *)dic {
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    NSArray *allKey = [dic allKeys];
    for (NSString *key in allKey) {
        [tempDic setObject:[self replaceNullData:dic[key]] forKey:key];
    }
    return tempDic;
}
    
    ///处理数组
- (id)replaceNullWithArray:(NSMutableArray *)arr {
    __block NSMutableArray *tempArr = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempArr addObject:[self replaceNullData:obj]];
    }];
    return tempArr;
}
    
    ///处理字符串
- (NSString *)replaceNullValue: (NSString *)string {
    NSString * newStr = [NSString stringWithFormat:@"%@",string];
    if ([newStr isKindOfClass:[NSNull class]] ||
        newStr == nil ||
        [newStr isEqualToString:@"(null)"]||
        [newStr isEqualToString:@""] ||
        [newStr isEqualToString:@"null"] ||
        [newStr isEqualToString:@"<null>"]) {
        newStr = @"";
    }
    return newStr;
}

    
@end
