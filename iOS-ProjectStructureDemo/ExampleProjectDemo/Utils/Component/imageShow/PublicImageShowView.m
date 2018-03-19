//
//  PublicImageShowView.m
//  jyhf
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "PublicImageShowView.h"
#import "PublicImageShowCell.h"
#import "PublicImageShowFlowLayout.h"

@interface PublicImageShowView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
/**
 导航背景
 */
@property (nonnull,nonatomic,strong) UIView *navigation_back;

/**
 page select
 */
@property (nonnull,nonatomic,strong) UILabel *label_page;

/**
 滑动视图
 */
@property (nonnull,nonatomic,strong) UICollectionView *collect_main;

/**
 数据源
 */
@property (nonnull,nonatomic,strong) NSArray *feedEntity;

/**
 选择第几个，选择中
 */
@property (nonatomic,assign) NSUInteger currentSelect;

/** block方式监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);

@end

@implementation PublicImageShowView

static NSString*const reuseIdentifier = @"reuseCell";

+ (void)Show_imageScrollWithDataArray:(NSArray *)dataSource SelectAt:(NSUInteger)idx ItemDidScrollOperationBlock:(void (^)(NSInteger))itemDidScrollOperationBlock
{
    PublicImageShowView *imageShowView = [[PublicImageShowView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageShowView.itemDidScrollOperationBlock = itemDidScrollOperationBlock;
    ((PublicImageShowFlowLayout*)imageShowView.collect_main.collectionViewLayout).contentOffset = CGPointMake(CUSTOM_SCREEN_WIDTH*idx, 0);
    imageShowView.feedEntity = dataSource;

    if (itemDidScrollOperationBlock) {
        itemDidScrollOperationBlock(idx);
    }
    imageShowView.label_page.text = [NSString stringWithFormat:@"%@/%@",@(idx+1),@(imageShowView.feedEntity.count)];
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:imageShowView];
    [imageShowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commInit];
    }
    return self;
}

- (void)commInit
{
    [self theSubViewAdd];
    [self theLayoutSet];
    [self theInteractionEvents];
    
}

- (void)theSubViewAdd
{
    [self add_mainCollect];
    [self add_backNavigation];
    [self add_pageLabel];
}

- (void)theLayoutSet
{
    [self.navigation_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44+CUSTOM_STATUSBAR_HEIGHT);
    }];
    
    [self.collect_main mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.label_page mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
}

- (void)theInteractionEvents
{
    
    @weakify(self);        
    [RACObserve(self.collect_main, contentOffset)subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        NSInteger select = (NSInteger)self.collect_main.contentOffset.x/self.collect_main.bounds.size.width;
        
        if (self.collect_main.contentOffset.x - select*self.collect_main.bounds.size.width > self.collect_main.bounds.size.width*2/3.0) {
            select ++;
        }
        if (select + 1 <= self.feedEntity.count) {
            select ++;
        }
        if (select > self.feedEntity.count) {
            select = self.feedEntity.count;
        }
        if (self.itemDidScrollOperationBlock && self.currentSelect != select) {
            self.itemDidScrollOperationBlock(select);
        }
        self.currentSelect = select;
        self.label_page.text = [NSString stringWithFormat:@"%@/%@",
                                @(select),@(self.feedEntity.count)];
    }];
}


#pragma mark-subView
- (void)add_backNavigation
{
    _navigation_back = [UIView new];
    _navigation_back.userInteractionEnabled = NO;
    _navigation_back.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    [self addSubview:_navigation_back];
}

- (void)add_mainCollect
{
    PublicImageShowFlowLayout *flow = [[PublicImageShowFlowLayout alloc]init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    
    _collect_main = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flow];
    _collect_main.backgroundColor = [UIColor blackColor];
    _collect_main.pagingEnabled = YES;
    _collect_main.delegate = self;
    _collect_main.dataSource = self;
    _collect_main.showsHorizontalScrollIndicator = NO;
    [_collect_main registerClass:[PublicImageShowCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self addSubview:_collect_main];
}

- (void)add_pageLabel
{
    _label_page = [[UILabel alloc]init];
    _label_page.textColor = [UIColor whiteColor];
    _label_page.font = [UIFont systemFontOfSize:18];
    [self.navigation_back addSubview:_label_page];
}

#pragma mark-collectionViewDele
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.feedEntity.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PublicImageShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell updata_setObject:self.feedEntity[indexPath.item]];
    cell.block = ^{
        [self removeFromSuperview];
    };
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.bounds.size;
}

@end
