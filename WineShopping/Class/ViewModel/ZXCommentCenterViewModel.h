//
//  ZXCommentCenterViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/5/1.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

///评价中心
@interface ZXCommentCenterViewModel : ZXBasedViewModel

@property(nonatomic,strong)NSMutableArray   *dataArray;

@property(nonatomic,strong)RACCommand       *refreshCommand;

@property(nonatomic,strong)RACCommand       *cellClickCommand;

///评价
@property(nonatomic,strong)RACCommand       *commentCommand;

@end
