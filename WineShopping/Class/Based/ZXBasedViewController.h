//
//  ZXBasedViewController.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXViewModelNavigationImpl.h"

@interface ZXBasedViewController : UIViewController

@property(nonatomic,strong,readonly)ZXBasedViewModel *viewModel;
@property(nonatomic,strong,readonly)UIPercentDrivenInteractiveTransition *interactivePopTransition;

- (instancetype)initWithViewModel:(ZXBasedViewModel *)viewModel;
- (void)bindViewModel;

@end
