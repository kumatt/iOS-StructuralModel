//
//  BaseTransformDetailViewController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/10.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformDetailViewController.h"
#import "BaseTransformDetailViewIndex.h"

#import "PublicPageMagicTransformViewModel.h"
#import "PublicPageCircleSpreadTransformViewModel.h"

@interface BaseTransformDetailViewController ()<PTPageRouterProtocol,PublicPageMagicTransformDelegate,UIViewControllerTransitioningDelegate,UINavigationBarDelegate>

@property (nonnull,nonatomic,strong) BaseTransformDetailViewIndex *index_view;

@end

@implementation BaseTransformDetailViewController

- (void)pt_setFormData:(NSDictionary *)formData
{
    self.title = formData[@"title"];
    NSUInteger select_id = [formData[@"id"] integerValue];
    NSDictionary *localData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"LocalHostData" ofType:@"plist"]];
    [self.index_view.imageView_head sd_setImageWithURL:[NSURL URLWithString:localData[@"photos"][select_id]]];
    self.index_view.label_title.text = localData[@"titles"][select_id];
    self.index_view.label_introduce.text = localData[@"descripts"][select_id];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    if (self.navigationController.viewControllers == nil) {
        [self.index_view layout_addBackButton];
        @weakify(self);
        [[self.index_view.button_back rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
}

#pragma mark-lazyload
- (BaseTransformDetailViewIndex *)index_view
{
    if (_index_view == nil) {
        _index_view = [BaseTransformDetailViewIndex new];
    }
    return _index_view;
}

#pragma mark-PublicPageMagicTransformDelegate
- (UIView *)magicTransform_getToView
{
    return self.index_view.imageView_head;
}

- (UIView *)magicTransform_getFromView
{
    return self.index_view.imageView_head;
}

#pragma mark-UINavigationBarDelegate push跳转自定义动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    PublicPageMagicTransformViewModel *transform = [PublicPageMagicTransformViewModel new];
    transform.operation = operation;
    return transform;
}

#pragma mark-UIViewControllerTransitioningDelegate present跳转自定义动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    PublicPageCircleSpreadTransformViewModel *transform = [PublicPageCircleSpreadTransformViewModel new];
    transform.operation = PublicPageCircleSpreadTransformTypePresent;
    return transform;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    PublicPageCircleSpreadTransformViewModel *transform = [PublicPageCircleSpreadTransformViewModel new];
    transform.operation = PublicPageCircleSpreadTransformTypeDismiss;
    return transform;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

@end
