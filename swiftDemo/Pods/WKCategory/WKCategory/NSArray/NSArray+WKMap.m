//
//  NSArray+WKMap.m
//  WKCategoryDemo
//
//  Created by admin on 2017/10/9.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "NSArray+WKMap.h"

@implementation NSArray (WKMap)

- (NSArray *)wkMap:(id (^)(id))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self) {
        [array addObject:block(object) ?: [NSNull null]];
    }
    
    return array;
}

@end
