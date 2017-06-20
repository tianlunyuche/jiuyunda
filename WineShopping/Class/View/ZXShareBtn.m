//
//  ZXShareBtn.m
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXShareBtn.h"

@implementation ZXShareBtn

+ (instancetype)button
{
    return [self buttonWithType:UIButtonTypeCustom];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (self.w_imageView)
    {
        return;
    }
    @weakify(self);
    self.w_imageView = [[UIImageView alloc]init];
    [self addSubview:self.w_imageView];
    [self.w_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self.mas_width);
    }];
    
    self.w_label                = [[UILabel alloc]init];
    self.w_label.textAlignment  = NSTextAlignmentCenter;
    self.w_label.textColor      = kRGBAColor(70, 70, 70, 1);
    self.w_label.font           = [UIFont zxNormalFont:14];
    [self addSubview:self.w_label];
    
    [self.w_label mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.w_imageView.mas_bottom).offset(5);
        make.left.equalTo(self.w_imageView).offset(-5);
        make.right.equalTo(self.w_imageView).offset(5);
        make.bottom.equalTo(self.mas_bottom);
    }];
}


@end
