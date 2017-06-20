//
//  ZXCategoryViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@interface ZXCategoryViewModel : ZXBasedViewModel

@property(nonatomic,strong)RACCommand           *refreshCommand;

@property(nonatomic,strong)NSArray              *leftArray;

@property(nonatomic,strong)NSMutableDictionary  *dataDic;

///筛选列表
@property(nonatomic,strong)NSMutableArray       *selectArray;

///左侧点击Command，需传入rightTableView、indexPath
@property(nonatomic,strong)RACCommand           *leftClickCommand;

@property(nonatomic,strong)RACCommand           *goodCommand;

///右侧tableView滑动
@property(nonatomic,strong)RACCommand           *rightCommand;

///筛选按钮点击
@property(nonatomic,strong)RACCommand           *selectedCommand;

///添加sift动画
- (void)beginShowAnimation:(id)x;
///移除sift动画
- (void)beginDismissAnimation:(id)x;

@end
