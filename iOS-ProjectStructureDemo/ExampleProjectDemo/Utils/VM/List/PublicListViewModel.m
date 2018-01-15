//
//  PublicListViewModel.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/1/15.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "PublicListViewModel.h"

@implementation PublicListViewModel

- (void)setListView:(UIScrollView *)listView
{
    _listView = listView;
    if ([listView isKindOfClass:[UITableView class]]) {
        ((UITableView*)listView).delegate = self;
        ((UITableView*)listView).dataSource = self;
    }else if ([listView isKindOfClass:[UICollectionView class]])
    {
        ((UICollectionView*)listView).delegate = self;
        ((UICollectionView*)listView).dataSource = self;
    }else{
        return;
    }
    
    if ([self.listView respondsToSelector:@selector(reloadData)] == NO) {
        return;
    }

    @weakify(self);
    [[listView rac_signalForSelector:@selector(reloadData)]subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self);
        if (self.emptyView == nil) {
            return ;
        }
        [self.listView isKindOfClass:[UITableView class]]?[self reset_nullDataTable:(id)self.listView]:[self reset_nullDataCollect:(id)self.listView];
    }];
}

#pragma mark-reset
- (void)reset_nullDataTable:(UITableView*)tableView
{
    NSUInteger sections = tableView.numberOfSections;
    if (sections == 0) {
        [self layout_NULLState];
        return;
    }
    for (NSUInteger idx = 0; idx < sections; idx ++) {
        if ([tableView numberOfRowsInSection:idx] > 0) {
            [self layout_FullState];
            return;
        }
    }
    [self layout_NULLState];
}

- (void)reset_nullDataCollect:(UICollectionView*)collectView
{
    NSUInteger sections = collectView.numberOfSections;
    if (sections == 0) {
        [self layout_NULLState];
        return;
    }
    for (NSUInteger idx = 0; idx < sections; idx ++) {
        if ([collectView numberOfItemsInSection:idx] > 0) {
            [self layout_FullState];
            return;
        }
    }
    [self layout_NULLState];
}

#pragma mark-layout
- (void)layout_NULLState
{
    if (self.emptyView.superview || self.listView == nil) {
        return;
    }
    [self.emptyView addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        //        make.width.equalTo(self.listView.mas_width);
        make.size.mas_equalTo(self.listView);
    }];
}

- (void)layout_FullState
{
    if (_emptyView.superview) {
        [_emptyView removeFromSuperview];
    }
}

#pragma mark-tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell<PublicListViewModelDelegate> *cell = [tableView dequeueReusableCellWithIdentifier:PublicList_ReuseIdentifier];    
    [self event_listCell:cell upData:self.dataSource[indexPath.item]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark-collectionViewDele
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell<PublicListViewModelDelegate> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PublicList_ReuseIdentifier forIndexPath:indexPath];
    [self event_listCell:cell upData:self.dataSource[indexPath.item]];
    return cell;
}

- (void)event_listCell:(id<PublicListViewModelDelegate>)cell upData:(id)data
{
    NSAssert([cell conformsToProtocol:@protocol(PublicListViewModelDelegate)], @"cell 必须遵循PublicListViewModelDelegate协议");
    NSAssert([cell respondsToSelector:@selector(updata_setObject:)] == NO, @"cell 必须实现PublicListViewModelDelegate协议的代理方法");
    [cell updata_setObject:data];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark-refresh
-(void)refresh_header
{
    self.page_current = 0;
    [self refresh_load];
}

- (void)refresh_footer
{
    self.page_current ++;
    [self refresh_load];
}

- (void)refresh_load
{
    
}

#pragma mark-lazyload
- (NSMutableArray<NSDictionary *> *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

@end
