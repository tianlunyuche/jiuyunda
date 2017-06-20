//
//  ZXSearchViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXSearchViewModel : ZXBasedViewModel

/// 搜索
@property(nonatomic,strong)RACCommand       *searchCommand;

///商品点击
@property(nonatomic,strong)RACCommand       *goodCommand;

@property(nonatomic,strong)RACCommand       *shoppingCarCommand;

///删除
@property(nonatomic,strong)RACCommand       *deleteHistory;

@property(nonatomic,weak)UIViewController *vc;

@end
