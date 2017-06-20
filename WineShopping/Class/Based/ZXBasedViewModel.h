//
//  ZXBasedViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXViewModelServices.h"
#import "ZXViewModelNavigationImpl.h"

@interface ZXBasedViewModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong,readonly)id<ZXViewModelServices> services;
@property(nonatomic,strong)ZXViewModelNavigationImpl *naviImpl;
@property(nonatomic,copy,readonly)NSDictionary *params;

- (instancetype)initWithService:(id<ZXViewModelServices>)service params:(NSDictionary *)params;

//判断是否登陆
//@param  goLogin 如果没有登录，是否跳转到登录页面
- (BOOL)judgeWhetherLogin:(BOOL)goGoLogin;

@end
