//
//  ZXCommentViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/5/1.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

@class ZXOrderModel;
@class ZXCommentVC;

@interface ZXCommentViewModel : ZXBasedViewModel

@property(nonatomic,strong)ZXOrderModel    *order;

@property(nonatomic,weak)ZXCommentVC       *vc;

@property(nonatomic,strong)RACCommand       *addPicCommand;

@property(nonatomic,strong)RACCommand       *commitCommand;

@property(nonatomic,strong)RACSubject       *changeImgSubject;
///评论
@property(nonatomic,copy)NSString           *comment;

@end
