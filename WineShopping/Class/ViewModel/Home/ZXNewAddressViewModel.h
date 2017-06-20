//
//  ZXNewAddressViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@class ZXNewAddressVC;

@interface ZXNewAddressViewModel : ZXBasedViewModel

@property(nonatomic,strong)ZXAddress       *address;
/// 保存
@property(nonatomic,strong)RACCommand       *saveCommand;
///删除
@property(nonatomic,strong)RACCommand       *deleteCommand;
/// 选择地址
@property(nonatomic,strong)RACCommand       *addressCommand;

///跳转通讯录
@property(nonatomic,strong)RACCommand       *phoneBookCommand;

///弱引用，用来present
@property(nonatomic,weak)ZXNewAddressVC    *vc;

/// 从通讯录获取的手机号
@property(nonatomic,copy)NSString           *phoneNum;
/// 从通讯录获取的姓名
@property(nonatomic,copy)NSString           *phoneName;

///地址String
@property(nonatomic,copy)NSString           *addressString;

@end
