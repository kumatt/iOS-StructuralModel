//
//  BaseTransformCircleSpreadViewIndex.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformCircleSpreadViewIndex.h"

@implementation BaseTransformCircleSpreadViewIndex

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
    [container addSubview:self.imageView_back];
    [container addSubview:self.button_present];
    [self subView_layout];
    [self subView_observe];
}

#pragma mark-subView
- (void)subView_load
{
    [self load_backImageView];
    [self load_presentButton];
}

- (void)subView_layout
{
    [self.imageView_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.button_present mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 0));
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
}
- (void)subView_observe
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesture_framePan:)];
    [self.button_present addGestureRecognizer:pan];
}

#pragma mark-gesture
- (void)gesture_framePan:(UIPanGestureRecognizer *)panGesture{
    //获取拖拽手势在self.view 的拖拽姿态
    CGPoint translation = [panGesture translationInView:self.container];
    //改变panGestureRecognizer.view的偏移量
//    CGFloat currentLeftSpace = translation.x+panGesture.view.transform.tx+panGesture.view.frame.origin.x;
//    CGFloat currentTopSpace = translation.y+panGesture.view.transform.ty+panGesture.view.frame.origin.y;
//    if (currentLeftSpace < 0) {
//        translation.x = -currentLeftSpace;
//    }else if (currentLeftSpace > self.container.bounds.size.width){
//        translation.x = self.container.bounds.size.width-currentLeftSpace;
//    }
//    if (currentTopSpace < 0) {
//        translation.y = -currentTopSpace;
//    }else if (currentLeftSpace > self.container.bounds.size.width){
//        translation.y = self.container.bounds.size.height-currentTopSpace;
//    }
    
    panGesture.view.transform = CGAffineTransformTranslate(panGesture.view.transform, translation.x, translation.y);
    //重置拖拽手势的姿态
    [panGesture setTranslation:CGPointZero inView:self.container];
}

#pragma mark-loadSubView
- (void)load_backImageView
{
    _imageView_back = [UIImageView new];
    _imageView_back.clipsToBounds = YES;
    _imageView_back.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)load_presentButton
{
    _button_present = [UIButton buttonWithType:UIButtonTypeCustom];
    _button_present.backgroundColor = [UIColor lightGrayColor];
    [_button_present setTitle:@"点击或\n拖动我" forState:UIControlStateNormal];
    _button_present.titleLabel.numberOfLines = 0;
    _button_present.titleLabel.font = [UIFont systemFontOfSize:11];
    [_button_present setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button_present.layer.cornerRadius = 20;
    _button_present.layer.masksToBounds = YES;
}

@end
