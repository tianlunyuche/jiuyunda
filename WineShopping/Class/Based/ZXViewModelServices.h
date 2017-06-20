//
//  ZXViewModelServices.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZXBasedViewModel;
@protocol ZXViewModelServices <NSObject>

- (void)pushViewModel:(ZXBasedViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewControllerWithAnimation:(BOOL)animated;
- (void)popToRootViewModelWithAnimation:(BOOL)animated;
- (void)presentViewModel:(ZXBasedViewModel *)viewModel animated:(BOOL)animated complete:(void(^)())complete;

//模态弹出vc ，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)())complete;

@end
