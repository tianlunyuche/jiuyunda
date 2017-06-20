//
//  ZXMacro.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#ifndef ZXMacro_h
#define ZXMacro_h

///读取用户数据完成
#define READ_USER_DATA_FINISH @"readUserDataFinish"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//打印调试
#ifdef DEBUG

#define ZXLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZXLog(...)
#endif

#pragma mark - 颜色

#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kCOLOR_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#define THEME_COLOR kRGBAColor(250, 98, 97, 1)

#define BACK_COLOR kRGBAColor(240,240,240,1)

#define BASE_COLOR kRGBAColor(243, 243, 246, 1.0)

#define BASE_COLOR1 kRGBAColor(210, 210, 210, 1.0)

#define THEME_COLOR kRGBAColor(250, 98, 97, 1)

#define THEME_COLOR_ALPHA kRGBAColor(250, 98, 97, 0.99)

#define BLACK_COLOR kRGBAColor(50,50,50,1)

#define WORDS_COLOR [UIColor colorWithHex:0x5c5c5c] // 常规文字

#define LINKS_COLOR [UIColor colorWithHex:0x333333] // 链接 (深绿)

#define LINE_COLOR [UIColor colorWithHex:0xe9e9e9]  // 描线色

#pragma mark - 宽高

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define ZOOM_SCALL kWidth/375.0

//url
#define IMG_URL @"http://www.jiuyunda.net:90"

//单例简化
#define kApplication  [UIApplication sharedApplication]

///userDefaults
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define CURRENT_USER [ZXUser currentUser]

#define SHOPPING_MANAGER [ZXShoppingManager manager]

///SVP
#define SHOW_SVP(title) \
[SVProgressHUD showWithStatus:title];

#define SHOW_ERROE(title) \
[SVProgressHUD showErrorWithStatus:title];

#define SHOW_SUCCESS(title) \
[SVProgressHUD showSuccessWithStatus:title];

#define DISMISS_SVP(time) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});

#endif /* ZXMacro_h */
