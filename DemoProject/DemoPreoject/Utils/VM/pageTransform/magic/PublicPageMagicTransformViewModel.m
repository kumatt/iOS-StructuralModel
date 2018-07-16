//
//  PublicPageMagicTransformViewModel.m
//  jNewsUI
//
//  Created by BlanBok on 2018/2/8.
//  Copyright © 2018年 juyuancf. All rights reserved.
//

#import "PublicPageMagicTransformViewModel.h"

@implementation PublicPageMagicTransformViewModel

/**
 *  动画时长
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.75;
}

/**
 *  如何执行过渡动画
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController<PublicPageMagicTransformDelegate> *fromVC = (id)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<PublicPageMagicTransformDelegate> *toVC = (id)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    NSAssert([fromVC conformsToProtocol:@protocol(PublicPageMagicTransformDelegate)], @"fromViewController 需遵循PublicPageMagicTransformDelegate协议");
    NSAssert([toVC conformsToProtocol:@protocol(PublicPageMagicTransformDelegate)], @"toViewController 需遵循PublicPageMagicTransformDelegate协议");
    NSAssert([fromVC respondsToSelector:@selector(magicTransform_getFromView)], @"fromViewController 需实现magicTransform_getFromView方法");
    NSAssert([toVC respondsToSelector:@selector(magicTransform_getToView)], @"toViewController 需实现magicTransform_getToView方法");
    
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [fromVC magicTransform_getFromView];
    UIView *toView = [toVC magicTransform_getToView];
    
    //snapshotViewAfterScreenUpdates 对cell的imageView截图保存成另一个视图用于过渡，并将视图转换到当前控制器的坐标
    UIView *tempView;
    if (self.operation == UINavigationControllerOperationPop) {
        tempView = containerView.subviews.lastObject;
        tempView.hidden = NO;
    }else{
        tempView = [fromView snapshotViewAfterScreenUpdates:NO];
    }
    
    tempView.frame = [fromView convertRect:fromView.bounds toView: containerView];
    //设置动画前的各个控件的状态
    fromView.hidden = YES;
    fromVC.view.alpha = 0;
    toView.hidden = YES;
    //tempView 添加到containerView中，要保证在最前方，所以后添加
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    //开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        tempView.frame = [toView convertRect:toView.bounds toView: containerView];
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toView.hidden = NO;
        //如果动画过渡取消了就标记不完成，否则才完成，这里可以直接写YES，如果有手势过渡才需要判断，必须标记，否则系统不会中动画完成的部署，会出现无法交互之类的bug
        [transitionContext completeTransition:YES];
    }];
}

@end
