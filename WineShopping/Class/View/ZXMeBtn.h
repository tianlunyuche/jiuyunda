//
//  ZXMeBtn.h
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMeBtn : UIButton

/**
 *  左上的提示
 */
@property(nonatomic,assign)NSInteger bageValue;
/**
 * 构建方法  最低高度65
 */
+ (instancetype)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName;


@end
