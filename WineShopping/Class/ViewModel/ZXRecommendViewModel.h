//
//  ZXRecommendViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/18.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXRecommendViewModel : ZXBasedViewModel

@property(nonatomic,strong)RACCommand *refershCommand;
@property(nonatomic,strong)RACCommand *shareCommand;

@end
