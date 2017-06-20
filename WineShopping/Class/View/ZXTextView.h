//
//  ZXTextView.h
//  WineShopping
//
//  Created by xinying on 2017/1/3.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTextView : UITextView
//灰色字
@property(nonatomic,copy)NSString *placeholder;

/**
 *  构建方法
 */
+ (instancetype)textView;

@end
