//
//  ZXMapSearchTableView.h
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXMapViewModel;

@interface ZXMapSearchTableView : UITableView

@property(nonatomic,strong)NSArray *searchArray;

@property(nonatomic,strong)ZXMapViewModel *viewModel;
@end
