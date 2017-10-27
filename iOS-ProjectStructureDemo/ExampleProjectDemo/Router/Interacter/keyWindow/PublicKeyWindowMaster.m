//
//  PublicKeyWindowMaster.m
//  ExampleProjectDemo
//
//  Created by admin on 2017/10/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicKeyWindowMaster.h"

@implementation PublicKeyWindowMaster


#pragma mark-lazyload
-  (PublicKeyWindowInteracter *)interacter
{
    if(_interacter == nil){
        _interacter = [PublicKeyWindowInteracter new];
    }
    return _interacter;
}

@end
