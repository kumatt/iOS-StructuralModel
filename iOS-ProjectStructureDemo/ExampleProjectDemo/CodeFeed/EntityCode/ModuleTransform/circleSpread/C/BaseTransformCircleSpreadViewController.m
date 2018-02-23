//
//  BaseTransformCircleSpreadViewController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformCircleSpreadViewController.h"
#import "BaseTransformCircleSpreadViewIndex.h"

#import "PublicPageCircleSpreadTransformDelegate.h"

@interface BaseTransformCircleSpreadViewController ()<PublicPageCircleSpreadTransformDelegate>

@property (nonnull,nonatomic,strong) BaseTransformCircleSpreadViewIndex *index_view;


@end

@implementation BaseTransformCircleSpreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"圆点扩散";
    [self init_commit];
}

- (void)init_commit
{
    [self setIndex_view];
}

#pragma mark-init
- (void)setIndex_view
{
    self.index_view.container = self.view;
    
    NSString *url = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"LocalHostData" ofType:@"plist"]][@"photos"][arc4random()%50];
    [self.index_view.imageView_back sd_setImageWithURL:[NSURL URLWithString:url]];
    
    @weakify(self);
    [[self.index_view.button_present rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        UIViewController<PTPublicPageRouterDelegate,UIViewControllerTransitioningDelegate> *vc = [NSClassFromString(@"BaseTransformDetailViewController")new];
        if (vc == nil) {
            return ;
        }
        [vc router_setParamentDict:@{@"title":@"圆点扩散"}];
        ///present跳转配置
        vc.transitioningDelegate = vc;
        vc.modalPresentationStyle = UIModalPresentationCustom;

        [self presentViewController:vc animated:YES completion:nil];
    }];
}

#pragma mark-lazyload
- (BaseTransformCircleSpreadViewIndex *)index_view
{
    if (_index_view == nil) {
        _index_view = [BaseTransformCircleSpreadViewIndex new];
    }
    return _index_view;
}

#pragma mark-PublicPageCircleSpreadTransformDelegate
- (UIView *)CircleSpreadTransform_getCircleView
{
    return self.index_view.button_present;
}

@end
