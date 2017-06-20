//
//  ZXCommentTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/20.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXComment;
@interface ZXCommentTableViewCell : UITableViewCell

///刷新cell
- (void)updateWithComment:(ZXComment *)comment;

@end
