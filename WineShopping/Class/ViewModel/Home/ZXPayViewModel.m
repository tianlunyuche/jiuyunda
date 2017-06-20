//
//  ZXPayViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/21.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXPayViewModel.h"
#import "ZXGoodsViewModel.h"
#import "ZXPaySuccessViewModel.h"
#import "ZXOrderModel.h"

@implementation ZXPayViewModel

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
    self.payCommand   = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        if (CURRENT_USER.isTouchID)
        {
            [ZXTool testTouchIDWithCompleteBlock:^(BOOL flag) {
                if (flag)
                {
                    NSInteger payType = [input integerValue];
                    SHOW_SVP(@"正在生成订单");
                    NSString *tip = payType == 1 ? @"微信支付成功" : payType == 2 ? @"支付宝支付成功" : @"支付成功";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        SHOW_SUCCESS(tip);
                        DISMISS_SVP(1.2);
                        [SHOPPING_MANAGER refreshGoods];
                        ZXPaySuccessViewModel *viewModel = [[ZXPaySuccessViewModel alloc]initWithService:self.services params:@{@"title":@"付款成功"}];
                        ZXOrderModel *model = [[ZXOrderModel alloc]initWithDic:@{@"ordertype":@(payType),@"paycost":[NSString stringWithFormat:@"%.2f",self.price]}];
                        viewModel.orderModel = model;
                        self.naviImpl.className = @"ZXPaySuccessVC";
                        [self.naviImpl pushViewModel:viewModel animated:YES];
                        
                    });
                }
            }];
        }
        else
        {
            SHOW_ERROE(@"请前往设置页面\n开通指纹支付");
            DISMISS_SVP(1.9);
        }
        return [RACSignal empty];
    }];
    
    self.goodCommand  = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"good");
        ZXGoodsViewModel *viewModel = [[ZXGoodsViewModel alloc]initWithService:self.services params:@{@"title":@"GoodsMessage"}];
        viewModel.goods = self.goodsArray[[input integerValue]];
        self.naviImpl.className = @"ZXGoodsVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}


#pragma mark - lazyLoad
- (CGFloat)price
{
    int a = 0;
    for (ZXGood *good in self.goodsArray)
    {
        a += good.price * good.num;
    }
    return a;
}


@end
