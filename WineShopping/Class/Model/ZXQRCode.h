//
//  ZXQRCode.h
//  WineShopping
//
//  Created by xinying on 2017/4/20.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger,ZXCodeType){
    ZXCodeTypeQRCode = 0,
    ZXCodeBarCode,
};

@interface ZXQRCode : NSObject

///构建方法
+ (instancetype)shareInstance;

/**
 *  创建二维码
 *  @param message  二维码信息
 *  @param size     要返回的图片大小
 */
+ (UIImage *)buildQRCodeWithMessage:(NSString *)message
                       withCodeType:(ZXCodeType)type
                           withSize:(CGSize)size;
/**
 *  扫描二维码
 *  @param vc       在那个viewController上面展示
 *  @param view     遮罩 (中间的框框)
 *  @param lineView 线
 *  @param complete 完成时的回调
 */
+ (void)scanWithView:(UIViewController *)vc
        withscanView:(UIView *)view
        withLineView:(UIView *)lineView
   withCompleteBlock:(void(^)(NSString *result))completeBlock;

///结束
+ (void)endScan;

@end
