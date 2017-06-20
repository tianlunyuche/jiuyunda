//
//  ZXOrderViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewController.h"

@interface ZXOrderViewModel : ZXBasedViewModel

@property(nonatomic,strong)NSMutableArray   *array;

@property(nonatomic,strong)RACCommand       *refreshCommand;

@property(nonatomic,strong)RACSubject       *menuClickSignal;

@property(nonatomic,strong)RACCommand       *cellClickCommand;

@property(nonatomic,assign)NSInteger        orderType;

@end
