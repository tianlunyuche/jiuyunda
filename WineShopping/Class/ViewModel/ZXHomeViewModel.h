//
//  ZXHomeViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXHomeViewModel : ZXBasedViewModel

/**刷新数据*/
@property(nonatomic,strong)RACCommand   *refreshCommand;

@property(nonatomic,strong)NSArray      *headData;

@property(nonatomic,strong)NSArray      *dataArray;

///头视图
@property(nonatomic,strong)RACCommand   *headCommand;

///中间按钮点击
@property(nonatomic,strong)RACCommand   *btnCommand;

///good
@property(nonatomic,strong)RACCommand   *goodCommand;

///导航栏
@property(nonatomic,strong)RACCommand   *naviCommand;

@property(nonatomic,strong)RACSubject   *searchSubject;

@end
