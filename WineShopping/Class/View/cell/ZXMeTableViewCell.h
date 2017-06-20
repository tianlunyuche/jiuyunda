//
//  ZXMeTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *w_titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *w_subTitleLabel;

- (void)updateTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
