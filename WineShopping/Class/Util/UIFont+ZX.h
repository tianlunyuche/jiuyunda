//
//  UIFont+ZX.h
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (ZX)
//屏幕适配 正常字体
+ (UIFont *)zxNormalFont:(CGFloat)size;
//屏幕适配 加粗字体
+ (UIFont *)zxBlodFont:(CGFloat)size;

@end
