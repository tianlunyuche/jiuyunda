//
//  ZXCommentCenterTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/5/3.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXOrderModel;

@interface ZXCommentCenterTableViewCell : UITableViewCell

///评价
@property(nonatomic,strong)RACSubject *commentSubject;

- (void)updateWithOrder:(ZXOrderModel *)order;

@end
