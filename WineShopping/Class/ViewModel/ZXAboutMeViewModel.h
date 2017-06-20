//
//  ZXAboutMeViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"
#import "ZXAboutMeVC.h"

/**
 *  头像选择器，性别，生日选择，地址管理 视图模型
 **/

@interface ZXAboutMeViewModel : ZXBasedViewModel

@property(nonatomic,strong)RACCommand   *cellClickCommand;

@property(nonatomic,weak)ZXAboutMeVC   *vc;

@end
