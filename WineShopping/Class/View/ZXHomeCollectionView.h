//
//  ZXHomeCollectionView.h
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXHomeViewModel.h"
@interface ZXHomeCollectionView : UICollectionView

@property(nonatomic,strong)NSArray          *headArray;

@property(nonatomic,strong)NSMutableArray   *dataArray;

@property(nonatomic,strong)ZXHomeViewModel *viewModel;

@end
