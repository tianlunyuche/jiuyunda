//
//  ZXPayViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXPayViewModel : ZXBasedViewModel

///本次买的商品
@property(nonatomic,strong)NSMutableArray   *goodsArray;
///总费用
@property(nonatomic,assign)CGFloat          price;

///确认付款
@property(nonatomic,strong)RACCommand       *payCommand;

///商品点击
@property(nonatomic,strong)RACCommand       *goodCommand;

@end
