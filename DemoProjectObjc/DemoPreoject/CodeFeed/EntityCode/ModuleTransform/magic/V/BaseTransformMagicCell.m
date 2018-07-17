//
//  BaseTransformMagicCell.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/9.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformMagicCell.h"

@interface BaseTransformMagicCell ()

/**
 主图
 */
@property (nonnull,nonatomic,strong) UIImageView *imageView_head;

/**
 标题
 */
@property (nonnull,nonatomic,strong) UILabel *label_title;

@end

@implementation BaseTransformMagicCell

- (void)updata_setObject:(NSNumber*)object
{
    NSDictionary *localData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"LocalHostData" ofType:@"plist"]];

    [self.imageView_head sd_setImageWithURL:[NSURL URLWithString:localData[@"photos"][object.integerValue]]];
    self.label_title.text = localData[@"names"][object.integerValue];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self init_commit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self init_commit];
    }
    return self;
}

- (void)init_commit
{
    [self subView_add];
    [self subView_layout];
}

- (void)subView_add
{
    [self add_headImageView];
    [self add_titleLabel];
}

- (void)subView_layout
{
    [self.imageView_head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-30);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.imageView_head.mas_bottom);
    }];
}
#pragma mark-subView
- (void)add_headImageView
{
    _imageView_head = [UIImageView new];
    [self.contentView addSubview:_imageView_head];
}

- (void)add_titleLabel
{
    _label_title = [UILabel new];
    _label_title.textAlignment = NSTextAlignmentCenter;
    _label_title.font = [UIFont systemFontOfSize:14];
    _label_title.textColor = CUSTOM_COLOR_HEX(0x666666);
    [self.contentView addSubview:_label_title];
}

@end
