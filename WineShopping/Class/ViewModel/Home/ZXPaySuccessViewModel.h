//
//  ZXPaySuccessViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@class ZXOrderModel;

@interface ZXPaySuccessViewModel : ZXBasedViewModel

@property(nonatomic,strong)ZXOrderModel    *orderModel;
///查看订单
@property(nonatomic,strong)RACCommand       *orderCommand;

///
@property(nonatomic,strong)RACCommand       *goHomeCommand;

@end
