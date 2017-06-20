//
//  ZXFunctionViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/5/5.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

/**
 * 其他功能设置，包括 声音是否开启，是否震动，是否开启指纹支付，是否开启夜间模式
 **/
@interface ZXFunctionViewModel : ZXBasedViewModel

@property(nonatomic,strong)RACCommand       *switchCommand;

@end
