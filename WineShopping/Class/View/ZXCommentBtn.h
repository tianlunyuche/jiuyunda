//
//  ZXCommentBtn.h
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCommentBtn : UIButton

@property(nonatomic,strong)UIColor  *w_titleColor;

/**
 * 构建方法
 */
+ (instancetype)buttonWithTitle:(NSString *)title
                       subTitle:(NSString *)subTitle;

///重设title
- (void)setTitle:(NSString *)title
        subTitle:(NSString *)subTitle;

@end
