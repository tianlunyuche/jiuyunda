//
//  ZXBasedViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"
#import "ZXLoginViewModel.h"

@interface ZXBasedViewModel ()

@property(nonatomic,strong,readwrite)id<ZXViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;

@end

@implementation ZXBasedViewModel

- (instancetype)initWithService:(id<ZXViewModelServices>)service params:(NSDictionary *)params{
    
    self =[super init];
    if (self) {
        self.title =params[@"title"];
        self.params =params;
        self.services =service;
    }
    return self;
}

- (BOOL)judgeWhetherLogin:(BOOL)goLogin{
    
    if ([ZXUser currentUser].isLogin) {
        
        return YES;
    }
    if (goLogin) {
        ZXLoginViewModel *viewModel =[[ZXLoginViewModel alloc] initWithService:self.services params:@{@"title":@"登录"}];
        self.naviImpl.className =@"ZXLoginVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
    }
    return NO;
}

@end
