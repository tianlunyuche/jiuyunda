//
//  ZXShoppingManager.h
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXShoppingManager : NSObject<NSCoding>

///商品
@property(nonatomic,strong)NSMutableDictionary  *goodsDic;

///记录购物车改变
@property(nonatomic,copy)NSString               *changed;

///标志是添加至购物车还是监听  NO-ADD
@property(nonatomic,assign)BOOL                 flag;

@property(nonatomic,strong)UIView               *view;

///当前购物车已选择的总价
@property(nonatomic,assign)CGFloat               price;

+ (instancetype)manager;

///刷新购物车物品（删除已经购买的）
- (void)refreshGoods;

@end
