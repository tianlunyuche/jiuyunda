//
//  ZXHomeHeadView.h
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXHomeHeadView : UICollectionReusableView

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)RACSubject *bannerSubject;
@property(nonatomic,strong)RACSubject *btnSubject;

@end
