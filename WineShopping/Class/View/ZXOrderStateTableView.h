//
//  ZXOrderStateTableView.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXOrderModel;

@interface ZXOrderStateTableView : UITableView

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)ZXOrderModel *order;

@end
