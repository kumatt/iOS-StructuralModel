//
//  PrapPageModel.m
//  PrapCloud
//
//  Created by Mac on 2018/7/16.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "PrapPageModel.h"

@implementation PrapPageModel

- (void)pt_upDatePageInfo
{
    if (self.path.length == 0) {
        return;
    }
    NSArray *keyArray = [self.path componentsSeparatedByString:@"/"];
    if (keyArray.count == 0) {
        return;
    }
    NSDictionary *formData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"RouterForm" ofType:@"plist"]];
    
    for (NSString *key in keyArray) {
        if ([formData[key] isKindOfClass:[NSDictionary class]] == NO) {
            return;
        }
        formData = formData[key];
    }
    [self setValuesForKeysWithDictionary:formData];
}


@end
