//
//  BaseHomeViewController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/1/15.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseHomeViewController.h"
#import "BaseHomeDataModelIndex.h"
#import "BaseHomeViewIndex.h"
#import "BaseHomeViewModelIndex.h"

@interface BaseHomeViewController ()

@property (nonnull,nonatomic,strong) BaseHomeDataModelIndex *index_dataModel;

@property (nonnull,nonatomic,strong) BaseHomeViewIndex *index_view;

@property (nonnull,nonatomic,strong) BaseHomeViewModelIndex *index_viewModel;


@end

@implementation BaseHomeViewController


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
- (BaseHomeDataModelIndex *)index_dataModel
{
    if (_index_dataModel == nil) {
        _index_dataModel = [BaseHomeDataModelIndex new];
    }
    return _index_dataModel;
}

- (BaseHomeViewIndex *)index_view
{
    if (_index_view == nil) {
        _index_view = [BaseHomeViewIndex new];
    }
    return _index_view;
}

- (BaseHomeViewModelIndex *)index_viewModel
{
    if (_index_viewModel == nil) {
        _index_viewModel = [BaseHomeViewModelIndex new];
    }
    return _index_viewModel;
}


@end
