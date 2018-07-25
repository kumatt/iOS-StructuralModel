//
//  BaseTransformMagicViewController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/9.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformMagicViewController.h"
#import "BaseTransformMagicCell.h"

#import "PublicPageMagicTransformDelegate.h"

@interface BaseTransformMagicViewController ()<PTPageRouterProtocol,PublicPageMagicTransformDelegate>
{
    UIView *_tempView;
}

@end

@implementation BaseTransformMagicViewController
static NSString * const reuseIdentifier = @"Cell";

- (void)pt_setFormData:(NSDictionary *)formData
{
    
}

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 180);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    self = [super initWithCollectionViewLayout:layout];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"神奇移动";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[BaseTransformMagicCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20+arc4random()%30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell<PublicListViewModelDelegate> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell updata_setObject:@(indexPath.item)];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _tempView = [[collectionView cellForItemAtIndexPath:indexPath]valueForKey:@"imageView_head"];
    
    UIViewController *resultVc = [MyPageRouter PT_getViewControllerFromKeyPath:@"TransformModule/detail" FormData:@{@"title":@"神奇跳转详情",@"id":@(indexPath.item)}];
    self.navigationController.delegate = (id)resultVc;
    [self.navigationController pushViewController:resultVc animated:YES];
    
//    [PublicPageRouter OpenUrlWithModalType:PublicPageRouterModuleTransformDetail DataEntity:@{@"title":@"神奇跳转详情",@"id":@(indexPath.item)} Animated:YES Completion:^(UIViewController * _Nullable toViewController) {
//        self.navigationController.delegate = (id)toViewController;
//    }];
}

#pragma mark-PublicPageMagicTransformDelegate
- (UIView *)magicTransform_getToView
{
    return _tempView;
}

- (UIView *)magicTransform_getFromView
{
    return _tempView;
}

@end
