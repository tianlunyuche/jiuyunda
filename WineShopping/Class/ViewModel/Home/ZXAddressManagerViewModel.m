//
//  ZXAddressManagerViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXAddressManagerViewModel.h"
#import "ZXNewAddressViewModel.h"

@implementation ZXAddressManagerViewModel

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
    self.addAddressCommand      = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        ZXNewAddressViewModel *viewModel = [[ZXNewAddressViewModel alloc]initWithService:self.services params:@{@"title":@"新建地址"}];
        self.naviImpl.className = @"ZXNewAddressVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        
        
        return [RACSignal empty];
    }];
    
    self.editAddress            = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        ZXLog(@"editAddress =%@",input);
        ZXNewAddressViewModel *viewModel = [[ZXNewAddressViewModel alloc]initWithService:self.services params:@{@"title":@"新建地址"}];
        viewModel.address = input;
        self.naviImpl.className = @"ZXNewAddressVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
    
    self.deleteAddress          = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [CURRENT_USER.address removeObject:input];
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"删"];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
    
    self.cellClickCommand       = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        if (self.isShoppingCar)
        {
            RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [subscriber sendNext:input];
                [subscriber sendCompleted];
                [self.naviImpl popViewControllerWithAnimation:YES];
                return nil;
            }];
            return signal;
        }
        else
        {
            //            设置本address为默认
            if (input == CURRENT_USER.defaultAddress)
            {
                //                已经是默认
                SHOW_ERROE(@"已经是默认地址");
                DISMISS_SVP(1.2);
            }
            else
            {
                CURRENT_USER.defaultAddress = input;
                SHOW_SUCCESS(@"设置成功");
                DISMISS_SVP(1.2);
            }
        }
        return [RACSignal empty];
    }];
}


@end
