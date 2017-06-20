//
//  ZXEmptyShoppingCarView.m
//  WineShopping
//
//  Created by xinying on 2017/4/22.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXEmptyShoppingCarView.h"

@implementation ZXEmptyShoppingCarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configView];
    }
    return self;
}

- (void)configView
{
    UIImageView *backGroudImage = [[UIImageView alloc] initWithFrame:self.frame];
    backGroudImage.image = [UIImage imageNamed:@"shopingcartvoid"];
    [self addSubview:backGroudImage];
    
    UILabel* tipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, kHeight/2-45, kWidth - 40, 21)];
    tipsLabel.textColor = [UIColor lightGrayColor];
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    NSString *sex = [[NSUserDefaults standardUserDefaults] objectForKey:@"sex"];
    if (sex.length == 0 || [sex isEqualToString:@"man"]) {
        tipsLabel.text = @"陛下,您的购物车是空的~~";
    }
    if ([sex isEqualToString:@"woman"]) {
        tipsLabel.text = @"女王,您的购物车是空的~~";
    }
    [self addSubview:tipsLabel];
    
    //设置一个和去逛逛 相等大小的button
    self.goShopBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    _goShopBtn.frame = CGRectMake(kWidth/2-60,kHeight/2 -10,120,40);
    [self addSubview:_goShopBtn];
}


@end
