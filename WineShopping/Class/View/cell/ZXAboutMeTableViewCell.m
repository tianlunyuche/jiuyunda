//
//  ZXAboutMeTableViewCell.m
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXAboutMeTableViewCell.h"

@implementation ZXAboutMeTableViewCell

- (void)updateWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    self.w_Label.text       = title;
    self.w_subLabel.text    = subTitle;
    if (subTitle.length > 0)
    {
        self.w_imageView.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.w_imageView.layer.cornerRadius = 65 / 2.0;
    self.w_imageView.layer.masksToBounds = YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
