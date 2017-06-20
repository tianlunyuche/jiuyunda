//
//  ZXSiftView.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  分类筛选视图
 */
@interface ZXSiftView : UIView

@property(nonatomic,strong)NSArray *dataArray;

@property(nonatomic,strong)RACSubject *dismissSubject;

///刷新数据
- (void)reloadData;

///移除
- (void)dismiss;

@end
