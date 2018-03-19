//
//  PublicImageShowCell.m
//  jyhf
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicImageShowCell.h"

@interface PublicImageShowCell ()<UIScrollViewDelegate>
/**
 滑动视图
 */
@property (nonnull,nonatomic,strong) UIScrollView *scrollView_back;

/**
 图片
 */
@property (nonnull,nonatomic,strong) UIImageView *imageView_head;
@end

@implementation PublicImageShowCell

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
    [self add_backScrollView];
    [self add_headImageView];
}

- (void)subView_layout
{
    [self.scrollView_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark-subView
- (void)add_backScrollView
{
    _scrollView_back = [[UIScrollView alloc]initWithFrame:self.contentView.bounds];
    _scrollView_back.showsVerticalScrollIndicator = NO;
    _scrollView_back.showsHorizontalScrollIndicator = NO;
    _scrollView_back.bounces = NO;
    _scrollView_back.maximumZoomScale = 2.0f;
    _scrollView_back.minimumZoomScale = 1.0f;
    _scrollView_back.delegate = self;
    [self.contentView addSubview:_scrollView_back];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchToCancel)];
    [_scrollView_back addGestureRecognizer:tap];
}

- (void)add_headImageView
{
    _imageView_head = [[UIImageView alloc]init];
    _imageView_head.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView_back addSubview:_imageView_head];
    
    UITapGestureRecognizer *tap_one = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchToCancel)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchTheTapGesture:)];
    tap.numberOfTapsRequired = 2;
    [_imageView_head addGestureRecognizer:tap];
    [_imageView_head addGestureRecognizer:tap_one];
    [tap_one requireGestureRecognizerToFail:tap];
    _imageView_head.userInteractionEnabled = YES;
}

#pragma mark-setdata
- (void)updata_setObject:(NSString*)object
{
    [self.scrollView_back setZoomScale:1];
    if (object == nil) {
        return;
    }
    [self.imageView_head sd_setImageWithURL:[NSURL URLWithString:object] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        CGRect imageBounds = self.contentView.bounds;
        if (image) {
            imageBounds = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.width*image.size.height/image.size.width);
        }
        self.imageView_head.bounds = imageBounds;
        self.scrollView_back.contentSize = imageBounds.size;
        
        CGFloat offsetX = (self.scrollView_back.bounds.size.width > self.scrollView_back.contentSize.width)?
        (self.scrollView_back.bounds.size.width - self.scrollView_back.contentSize.width) * 0.5 : 0.0;
        CGFloat offsetY = (self.scrollView_back.bounds.size.height > self.scrollView_back.contentSize.height)?
        (self.scrollView_back.bounds.size.height - self.scrollView_back.contentSize.height) * 0.5 : 0.0;
        self.imageView_head.center = CGPointMake(self.scrollView_back.contentSize.width * 0.5 + offsetX,
                                                 self.scrollView_back.contentSize.height * 0.5 + offsetY);
    }];
    
}

#pragma mark-gesture
- (void)touchTheTapGesture:(UITapGestureRecognizer*)tap
{
    [self.scrollView_back setZoomScale:self.scrollView_back.zoomScale==1.0f?1.5f:1.0f animated:YES];
}

- (void)touchToCancel
{
    if (self.block) {
        self.block();
    }
}

#pragma mark-UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView_head;
}

//让图片居中
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    self.imageView_head.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                             scrollView.contentSize.height * 0.5 + offsetY);
}

@end
