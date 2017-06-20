//
//  ZXRequestManager.h
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXRequestManager : NSObject

//+ (instancetype)shareManager;
///本地数据（array）
+ (RACSignal *)postArrayDataWithURL:(NSString *)urlString
                       withpramater:(NSDictionary *)paremater;

//本地数据（dic）
+ (RACSignal *)postDicDataWithURL:(NSString *)urlString
                     withpramater:(NSDictionary *)paremater;

+ (RACSignal *)getWithURL:(NSString *)urlString
            withParamater:(NSDictionary *)paramter;

+ (RACSignal *)postWithURL:(NSString *)urlString
             withParamater:(NSDictionary *)parameter;

@end
