//
//  ZXOrderTableView.h
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXOrderViewModel;

@interface ZXOrderTableView : UITableView

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)ZXOrderViewModel *viewModel;


@end
