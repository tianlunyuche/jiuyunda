//
//  ZXOrderStateTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXOrderStateTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel        *w_timeLabel;

@property (weak, nonatomic) IBOutlet UIView         *w_topLine;

@property (weak, nonatomic) IBOutlet UIView         *w_bottomLine;

@property (weak, nonatomic) IBOutlet UIImageView    *w_tatusImageView;
@property (weak, nonatomic) IBOutlet UILabel        *w_statusLabel;

@end
