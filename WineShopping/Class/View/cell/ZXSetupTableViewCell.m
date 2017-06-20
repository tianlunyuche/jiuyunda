//
//  ZXSetupTableViewCell.m
//  WineShopping
//
//  Created by xinying on 20174/18.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXSetupTableViewCell.h"

@implementation ZXSetupTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateTitle:(NSString *)title subTitle:(NSString *)subtitle
{
    self.w_titleLabel.text  = title;
    self.w_subTitle.text    = subtitle;
    if (subtitle.length > 0)
    {
        self.w_imageView.hidden = YES;
    }
    else
    {
        self.w_imageView.hidden = NO;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
