//
//  ZXHomeCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXHomeCell : UICollectionViewCell

///是否为搜索界面的cell(标志是否做动画)
@property(nonatomic,assign)BOOL isSearch;

- (void)updateGood:(ZXGood *)goods;

@end
