//
//  PublicPageRouter.m
//  PT-PageRouterDemo
//
//  Created by admin on 2017/12/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicPageRouter.h"

@implementation PublicPageRouter

+ (void)OpenUrlWithModalType:(PublicPageRouterType *)modalType DataEntity:(NSDictionary *)entity Animated:(BOOL)animated
{
    [PTPublicPageRouter OpenUrl:[self Get_urlWithType:modalType] FormData:entity Animated:animated];
}

+ (NSURL*)Get_urlWithType:(NSString*)modalType
{
    NSArray *array = [modalType componentsSeparatedByString:@"&"];
    NSArray *keyArray = @[PTPublicPageRouterKeyClass,PTPublicPageRouterKeyPath];
    NSString *resultStr = @"?";
    for (NSUInteger idx = 0; idx < MIN(array.count, keyArray.count); idx ++) {
        resultStr = [resultStr stringByAppendingFormat:@"%@%@=%@",(resultStr.length == 1)?@"":@"&",keyArray[idx],array[idx]];
    }
    NSString *path = [[NSBundle mainBundle]pathForResource:@"RouterForm" ofType:@"plist"];
    resultStr = [path stringByAppendingString:resultStr];
    
    return [NSURL URLWithString:[resultStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
}

@end
