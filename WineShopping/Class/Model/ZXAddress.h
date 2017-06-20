//
//  ZXAddress.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXAddress : NSObject<NSCoding>
//名字
@property(nonatomic,copy)NSString *w_name;

//地址
@property(nonatomic,copy)NSString *w_address;

//手机号
@property(nonatomic,copy)NSString *w_phone;

///性别 YES-男 NO-女
@property(nonatomic,assign)BOOL     w_sex;

///详细地址
@property(nonatomic,copy)NSString   *w_detailAddress;

@end
