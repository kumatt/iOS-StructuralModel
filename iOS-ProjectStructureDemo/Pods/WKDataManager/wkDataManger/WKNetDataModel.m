//
//  WKNetDataModel.m
//  WKDataManager
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "WKNetDataModel.h"

@implementation WKNetDataModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
        
}

#pragma mark-dealData
- (void)dealResponseObject:(NSData*)responseObject
{
    if (responseObject == nil) {
        
        [self sessionFailuredForHTTPRequestWithError:nil];
        return;
    }
    [self setRulesWithJsonData:responseObject];
}

- (void)setRulesWithJsonData:(id)jsonData
{
    if (self.success) {
        self.success(jsonData);
    }
}
    
- (void)sessionFailuredForHTTPRequestWithError:(id)error
{
    if (self.failure) {
        self.failure(error);
    }
}
    
@end
