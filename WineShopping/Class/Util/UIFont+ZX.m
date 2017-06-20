//
//  UIFont+ZX.m
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "UIFont+ZX.h"

@implementation UIFont (ZX)

//屏幕适配 字体
+ (UIFont *)zxNormalFont:(CGFloat)size{
    if (kWidth ==320 || kWidth ==640) {
        return [UIFont systemFontOfSize:size -1];
    }
    else if(kWidth ==375 || kWidth ==750){
        return [UIFont systemFontOfSize:size];
    }
    else{
        return [UIFont systemFontOfSize:size +1];
    }
}

+ (UIFont *)zxBlodFont:(CGFloat)size{
    if (kWidth ==320 || kWidth ==640) {
        return [UIFont boldSystemFontOfSize:size -1];
    }
    else if(kWidth ==375 || kWidth ==750){
        return [UIFont boldSystemFontOfSize:size];
    }
    else{
        return [UIFont boldSystemFontOfSize:size +1];
    }
}

@end
