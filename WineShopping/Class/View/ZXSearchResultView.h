//
//  ZXSearchResultView.h
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXSearchViewModel;

@interface ZXSearchResultView : UIView

@property(nonatomic,strong)NSArray              *dataArray;

@property(nonatomic,strong)ZXSearchViewModel   *viewModel;

///刷新
- (void)w_reloadData;
@end
