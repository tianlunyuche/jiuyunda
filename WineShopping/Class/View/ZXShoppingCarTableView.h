//
//  ZXShoppingCarTableView.h
//  WineShopping
//
//  Created by xinying on 2017/4/22.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXShoppingCarViewModel;

@interface ZXShoppingCarTableView : UITableView

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)ZXShoppingCarViewModel *viewModel;

- (void)w_reloadData;

@end
