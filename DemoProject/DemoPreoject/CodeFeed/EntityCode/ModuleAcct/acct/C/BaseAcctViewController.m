//
//  BaseAcctViewController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/1/15.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseAcctViewController.h"
#import "BaseAcctDataModelIndex.h"
#import "BaseAcctViewIndex.h"
#import "BaseAcctViewModelIndex.h"

@interface BaseAcctViewController ()

@property (nonnull,nonatomic,strong) BaseAcctDataModelIndex *index_dataModel;

@property (nonnull,nonatomic,strong) BaseAcctViewIndex *index_view;

@property (nonnull,nonatomic,strong) BaseAcctViewModelIndex *index_viewModel;


@end

@implementation BaseAcctViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CUSTOM_COLOR_HEX(0xf4f4f4);
    [self init_commit];
}

- (void)init_commit
{
    [self setIndex_dataModel];
    [self setIndex_view];
    [self setIndex_viewModel];
}

#pragma mark-init
- (void)setIndex_dataModel
{
    
}

- (void)setIndex_view
{
    self.index_view.container = self.view;
}

- (void)setIndex_viewModel
{
    
}

#pragma mark-lazyload
- (BaseAcctDataModelIndex *)index_dataModel
{
    if (_index_dataModel == nil) {
        _index_dataModel = [BaseAcctDataModelIndex new];
    }
    return _index_dataModel;
}

- (BaseAcctViewIndex *)index_view
{
    if (_index_view == nil) {
        _index_view = [BaseAcctViewIndex new];
    }
    return _index_view;
}

- (BaseAcctViewModelIndex *)index_viewModel
{
    if (_index_viewModel == nil) {
        _index_viewModel = [BaseAcctViewModelIndex new];
    }
    return _index_viewModel;
}


@end
