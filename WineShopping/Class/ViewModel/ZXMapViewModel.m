//
//  ZXMapViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/23.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXMapViewModel.h"
#import <BaiduMapAPI_Search/BMKPoiSearch.h>

@implementation ZXMapViewModel

- (instancetype)initWithService:(id<ZXViewModelServices>)service params:(NSDictionary *)params
{
    self = [super initWithService:service params:params];
    if (self)
    {
        [self initViewModel];
    }
    return self;
}
- (void)initViewModel
{
    @weakify(self);
    self.addressSubject = [RACSubject subject];
    self.cellClick      = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        BMKPoiInfo *poiInfo = input;
        NSDictionary *dic = @{@"address":poiInfo.address,@"city":poiInfo.city,@"name":poiInfo.name};
        @strongify(self);
        [self.addressSubject sendNext:dic];
        [self.naviImpl popViewControllerWithAnimation:YES];
        return [RACSignal empty];
    }];
}

@end
