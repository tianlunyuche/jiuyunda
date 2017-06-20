//
//  ZXSiftTableViewCell.m
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXSiftTableViewCell.h"
#import "ZXSiftModel.h"

@implementation ZXSiftTableViewCell

- (void)updateWithModel:(ZXSiftModel *)model
{
    self.w_Label.text = model.name;
    if (model.isSelected)
    {
        self.w_imageView.hidden = NO;
        self.w_Label.textColor  = THEME_COLOR;
    }
    else
    {
        self.w_Label.textColor  = kRGBAColor(80, 80, 80, 1);
        self.w_imageView.hidden = YES;
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
