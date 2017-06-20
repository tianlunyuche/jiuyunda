//
//  ZXCategoryLeftTableViewCell.m
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXCategoryLeftTableViewCell.h"

@implementation ZXCategoryLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = kRGBAColor(240, 240, 240, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.backgroundColor    = selected ? [UIColor whiteColor] : kRGBAColor(242, 242, 242, 1);
    self.w_label.textColor  = selected ? THEME_COLOR : kRGBAColor(70, 70, 70, 1);
    
}


@end
