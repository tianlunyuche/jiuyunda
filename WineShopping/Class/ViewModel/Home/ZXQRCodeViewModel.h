//
//  ZXQRCodeViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXQRCodeViewModel : ZXBasedViewModel

@property(nonatomic,strong)RACCommand       *scanCommand;

@end
