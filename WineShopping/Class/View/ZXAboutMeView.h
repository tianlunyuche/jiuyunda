//
//  ZXAboutMeView.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 关于
 **/
@interface ZXAboutMeView : UIView

@property(nonatomic,strong)RACSubject   *clickSubject;

/**
 * 初始化
 * param titleArray 标题(1-3个)
 */
- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray<NSString *> *)titleArray;

@end
