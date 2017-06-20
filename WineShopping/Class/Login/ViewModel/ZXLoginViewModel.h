//
//  ZXLoginViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXLoginViewModel : ZXBasedViewModel

@property(nonatomic,strong)NSString *phoneNum;

@property(nonatomic,strong)NSString *codeNum;

@property(nonatomic,strong)RACSignal *phoneSignal;

@property(nonatomic,strong)RACSignal *canLoginSignal;

/**是否可以点击发送验证码*/
@property(nonatomic,strong)RACSignal *canCodeSignal;

@property(nonatomic,strong)RACCommand *codeCommand;

@property(nonatomic,strong)RACCommand *loginCommand;


@end
