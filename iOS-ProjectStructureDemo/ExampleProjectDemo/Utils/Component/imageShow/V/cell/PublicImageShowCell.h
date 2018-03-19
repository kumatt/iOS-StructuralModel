//
//  PublicImageShowCell.h
//  jyhf
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicListViewModelDelegate.h"
typedef void(^blockVoid)(void);

@interface PublicImageShowCell : UICollectionViewCell<PublicListViewModelDelegate>

/**
 回调事件
 */
@property (nonnull,nonatomic,copy) blockVoid block;


@end
