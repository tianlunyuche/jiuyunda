//
//  ZXOrderDetailViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/18.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@class ZXOrderModel;

@interface ZXOrderDetailViewModel : ZXBasedViewModel

@property(nonatomic,strong)ZXOrderModel    *order;

@property(nonatomic,strong)RACSubject       *segmentSubject;

@property(nonatomic,strong)RACCommand       *requestStatusCommand;

@property(nonatomic,strong)NSMutableArray   *statusArray;

/**刷新detailTableView*/
@property(nonatomic,strong)RACCommand       *refreshDetail;

/**刷新statusTableView*/
@property(nonatomic,strong)RACCommand       *refreshStatus;

@end
