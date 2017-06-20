//
//  ZXNavigationController.m
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXNavigationController.h"
#import "WTKBaseAnimation.h"
@interface ZXNavigationController ()<UINavigationControllerDelegate>

@end

@implementation ZXNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetNavi];
    self.delegate = self;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}

/**
 导航栏
 */
- (void)resetNavi
{
    //
    //
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(WTKBaseAnimation*) animationControlle
{
    return animationControlle.interactivePopTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(ZXBasedViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    //    WTKBaseAnimation *animation = [[WTKBaseAnimation alloc]init];
    if (fromVC.interactivePopTransition)
    {
        WTKBaseAnimation *animation = [[WTKBaseAnimation alloc]initWithType:operation Duration:0.6 animateType:WTKAnimateTypeRound];
        animation.interactivePopTransition = fromVC.interactivePopTransition;
        return animation; //手势
    }
    else
    {
        WTKBaseAnimation *animation = [[WTKBaseAnimation alloc]initWithType:operation Duration:0.6 animateType:WTKAnimateTypeRound];
        return animation;//非手势
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
