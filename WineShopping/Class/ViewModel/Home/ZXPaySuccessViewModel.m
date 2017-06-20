//
//  ZXPaySuccessViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXPaySuccessViewModel.h"
#import "ZXOrderViewModel.h"

@implementation ZXPaySuccessViewModel

- (instancetype)initWithService:(id<ZXViewModelServices>)service params:(NSDictionary *)params
{
    self = [super initWithService:self.services params:params];
    if (self)
    {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    self.orderCommand       = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        ZXOrderViewModel *viewModel = [[ZXOrderViewModel alloc]initWithService:self.services params:@{@"title":@"全部订单"}];
        viewModel.orderType = 0;
        self.naviImpl.className = @"ZXOrderVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
    
    self.goHomeCommand      = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        [self.naviImpl popToRootViewModelWithAnimation:YES];
        return [RACSignal empty];
    }];
}

@end
