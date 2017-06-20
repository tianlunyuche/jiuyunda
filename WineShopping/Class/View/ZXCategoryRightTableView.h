//
//  ZXCategoryRightTableView.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXCategoryViewModel;

@interface ZXCategoryRightTableView : UITableView

@property(nonatomic,strong)NSArray                  *sectionArray;

@property(nonatomic,strong)NSDictionary             *dataDic;

@property(nonatomic,strong)ZXCategoryViewModel     *viewModel;
@end
