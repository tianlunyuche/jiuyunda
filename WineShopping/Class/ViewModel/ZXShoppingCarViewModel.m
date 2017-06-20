//
//  ZXShoppingCarViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXShoppingCarViewModel.h"
#import "ZXGoodsViewModel.h"
#import "ZXPayViewModel.h"
#import "ZXAddressManagerViewModel.h"

@implementation ZXShoppingCarViewModel

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
    self.emptySubject           = [RACSubject subject];
    // - 监听价格
    [RACObserve([ZXShoppingManager manager], changed) subscribeNext:^(id x) {
        static BOOL isFirst;//是否是第一次检测到没有选中。用来避免多次改变selectAllBtn
        isFirst                 = YES;
        SHOPPING_MANAGER.flag   = YES;
        NSDictionary *dic       = SHOPPING_MANAGER.goodsDic;
        [[dic allValues] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            ZXGood *good = obj;
            if(isFirst && !good.w_isSelected && !self.isClickAllBtn)
            {
                //                self.selectAllBtn.selected = !self.selectAllBtn;
                isFirst = NO;
                self.btnState = NO;
            }
            if (idx == 0)
            {
                SHOPPING_MANAGER.price = 0;
            }
            if (good.w_isSelected)
            {
                SHOPPING_MANAGER.price += good.price * good.num;
            }
            if (idx == [dic allValues].count - 1 && isFirst && !self.isClickAllBtn)
            {
                self.btnState = YES;
            }
            if(idx == [dic allValues].count - 1)
            {
                //                self.isClickAllBtn = NO;
                self.isClickAllBtn = NO;
            }
            //            self.priceLabel.text    = [NSString stringWithFormat:@"共¥ %.2f",SHOPPING_MANAGER.price];
            self.price = [NSString stringWithFormat:@"共¥ %.2f",SHOPPING_MANAGER.price];
        }];
        SHOPPING_MANAGER.flag = NO;
        [self.emptySubject sendNext:@([dic allValues].count)];
        
    }];
    
    self.goodClickCommand       = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        ZXGoodsViewModel *viewModel = [[ZXGoodsViewModel alloc]initWithService:self.services params:@{@"title":@"商品详情"}];
        viewModel.goods = (ZXGood *)input;
        self.naviImpl.className = @"ZXGoodsVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        
        return [RACSignal empty];
    }];
    
    self.addressCommand         = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        ZXAddressManagerViewModel *viewModel = [[ZXAddressManagerViewModel alloc]initWithService:self.services params:@{@"title":@"选择地址"}];
        viewModel.isShoppingCar = YES;
        [viewModel.cellClickCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
            self.address = x;
        }];
        self.naviImpl.className = @"ZXAddressManagerVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        
        
        return [RACSignal empty];
    }];
    
    self.payCommand             = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        //        是否登录
        if ([self judgeWhetherLogin:YES])
        {
            //        跳转支付
            if ([[self.price substringFromIndex:2] floatValue] > 0)
            {
                ZXPayViewModel *viewModel = [[ZXPayViewModel alloc]initWithService:self.services params:@{@"title":@"结算付款"}];
                self.naviImpl.className = @"ZXPayVC";
                NSMutableArray *array = @[].mutableCopy;
                [[SHOPPING_MANAGER.goodsDic allValues] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    ZXGood *good = obj;
                    if (good.w_isSelected)
                    {
                        [array addObject:obj];
                    }
                }];
                viewModel.goodsArray = array;
                [self.naviImpl pushViewModel:viewModel animated:YES];
                
            }
            else
            {
                SHOW_ERROE(@"您还没有选择物品");
                DISMISS_SVP(1.3);
            }
        }
        
        
        return [RACSignal empty];
    }];
    
}
- (ZXAddress *)address
{
    if (!_address)
    {
        _address = CURRENT_USER.defaultAddress;
    }
    return _address;
}

@end
