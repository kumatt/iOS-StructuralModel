//
//  BaseTransformDetailViewIndex.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformDetailViewIndex.h"

@implementation BaseTransformDetailViewIndex

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self subView_load];
    }
    return self;
}

- (void)setContainer:(UIView *)container
{
    _container = container;
    [container addSubview:self.contentView];
    [self subView_layout];
}

#pragma mark-subView
- (void)subView_load
{
    [self load_contentView];
    [self load_headImageView];
    [self load_titleLabel];
    [self load_introduceLabel];
}

- (void)subView_layout
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.imageView_head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(self.imageView_head.mas_width).multipliedBy(0.75);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self.imageView_head.mas_bottom).offset(15);
    }];
    [self.label_introduce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self.label_title.mas_bottom).offset(15);
        make.bottom.mas_equalTo(-15);
    }];
}

#pragma mark-layoutSubView
- (void)layout_addBackButton
{
    if (_button_back.superview) {
        return;
    }
    [self.container addSubview:self.button_back];
    [self.button_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(CUSTOM_STATUSBAR_HEIGHT);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 44));
    }];
}

#pragma mark-loadSubView
- (void)load_contentView
{
    _contentView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _contentView.showsVerticalScrollIndicator = NO;
}

- (void)load_headImageView
{
    _imageView_head = [UIImageView new];
    _imageView_head.frame = CGRectMake(0, 0, CUSTOM_SCREEN_WIDTH, CUSTOM_SCREEN_WIDTH*0.75);
    [_contentView addSubview:_imageView_head];
}

- (void)load_titleLabel
{
    _label_title = [UILabel new];
    _label_title.font = [UIFont systemFontOfSize:16];
    _label_title.textColor = CUSTOM_COLOR_HEX(0x333333);
    _label_title.numberOfLines = 0;
    [_contentView addSubview:_label_title];
}

- (void)load_introduceLabel
{
    _label_introduce = [UILabel new];
    _label_introduce.font = [UIFont systemFontOfSize:14];
    _label_introduce.textColor = CUSTOM_COLOR_HEX(0x666666);
    _label_introduce.numberOfLines = 0;
    [_contentView addSubview:_label_introduce];
}

#pragma mark-lazyload
- (UIButton *)button_back
{
    if (_button_back == nil) {
        _button_back = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button_back setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
        _button_back.frame = CGRectMake(0, CUSTOM_STATUSBAR_HEIGHT, 40, 44);
    }
    return _button_back;
}

@end
