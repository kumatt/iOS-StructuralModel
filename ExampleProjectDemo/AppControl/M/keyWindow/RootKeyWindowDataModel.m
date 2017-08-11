//
//  RootKeyWindowDataModel.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "RootKeyWindowDataModel.h"

@implementation RootKeyWindowDataModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title      = @"";
        self.class_name = @"";

        self.normalImage_name = @"";
        self.selectImage_name = @"";
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
