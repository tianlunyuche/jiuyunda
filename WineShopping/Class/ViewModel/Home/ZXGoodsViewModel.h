//
//  ZXGoodsViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/17.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@class ZXGood;

@interface ZXGoodsViewModel : ZXBasedViewModel

@property(nonatomic,strong)ZXGood *goods;
@property(nonatomic,strong)RACCommand *addCommand;
@property(nonatomic,strong)RACCommand *clickShopCommand;
@property(nonatomic,strong)RACCommand *shareCommand;

@property(nonatomic,strong)NSMutableArray *commentArray;

@property(nonatomic,strong)NSDictionary     *titleDic;
///刷新评论
@property(nonatomic,strong)RACCommand       *refreshCommand;
///评论类型
@property(nonatomic,strong)RACCommand       *menuCommand;

@end
