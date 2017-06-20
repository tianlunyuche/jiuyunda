//
//  ZXMeHeaderView.h
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXMeViewModel;

@interface ZXMeHeaderView : UIView

@property (strong, nonatomic) UIImageView   *w_headImage;
@property (strong, nonatomic) UILabel       *w_nickNameLabel;
@property (strong, nonatomic) UILabel       *w_phoneNum;
@property (strong, nonatomic) UILabel       *w_collecLabel;
@property (strong, nonatomic) UILabel       *w_historyLabel;
@property (strong, nonatomic) UIImageView   *w_noLoginHead;
@property (strong, nonatomic) UIImageView   *w_right;
@property(nonatomic,strong)   ZXMeViewModel *viewModel;

/**刷新，根据是否登录*/
- (void)update;

@end
