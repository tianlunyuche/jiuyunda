//
//  ZXGoodManagerView.h
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXGood;

@interface ZXGoodManagerView : UIView

///已添加购物车数量
@property (nonatomic, assign) NSInteger num;

/// 添加到购物车
@property(nonatomic,strong)RACSubject   *addSubject;

///移除时发送信号
@property(nonatomic,strong)RACSubject   *reduceSubject;

- (void)updateGood:(ZXGood *)good;

@end
