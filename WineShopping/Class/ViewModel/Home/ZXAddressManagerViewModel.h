//
//  ZXAddressManagerViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXAddressManagerViewModel : ZXBasedViewModel

//新建地址
@property(nonatomic,strong)RACCommand       *addAddressCommand;
//编辑地址
@property(nonatomic,strong)RACCommand       *editAddress;

//删除
@property(nonatomic,strong)RACCommand       *deleteAddress;

//判断是否从购物车进来
@property(nonatomic,assign)BOOL             isShoppingCar;

//点击cell
@property(nonatomic,strong)RACCommand       *cellClickCommand;

@end
