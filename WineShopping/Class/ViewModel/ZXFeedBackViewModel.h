//
//  ZXFeedBackViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/5/4.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

/**
 *  意见提交（反馈） 视图模型
 **/

@interface ZXFeedBackViewModel : ZXBasedViewModel

///类型
@property(nonatomic,assign)NSInteger    *ideaType;

///提交
@property(nonatomic,strong)RACCommand   *submitConmand;

@end
