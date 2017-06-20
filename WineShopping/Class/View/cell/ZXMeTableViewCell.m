//
//  ZXMeTableViewCell.m
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXMeTableViewCell.h"

@implementation ZXMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)updateTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    self.w_titleLabel.text = title;
    if (subTitle.length <= 0)
    {
        self.w_subTitleLabel.hidden = YES;
    }
    else
    {
        self.w_subTitleLabel.text   = subTitle;
        self.w_subTitleLabel.hidden = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
