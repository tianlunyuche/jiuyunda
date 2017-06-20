//
//  ZXSetupViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

/**
 * 设置，包括清除图片缓存   和其他功能
 **/
@interface ZXSetupViewModel : ZXBasedViewModel

@property(nonatomic,strong)RACSubject *cellClickSubject;

@property(nonatomic,strong)RACSubject *exitSubject;


@end
