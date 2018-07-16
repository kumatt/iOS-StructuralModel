//
//  PublicImageShowFlowLayout.m
//  jyhf
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicImageShowFlowLayout.h"

@implementation PublicImageShowFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.collectionView.contentOffset = _contentOffset;
    _contentOffset = CGPointZero;
}

@end
