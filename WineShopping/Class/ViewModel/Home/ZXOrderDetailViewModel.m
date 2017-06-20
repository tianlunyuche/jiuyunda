//
//  ZXOrderDetailViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/18.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXOrderDetailViewModel.h"
#import "ZXOrderModel.h"

@implementation ZXOrderDetailViewModel

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
    self.segmentSubject     = [RACSubject subject];
    [self.segmentSubject subscribeNext:^(id x) {
        
        
    }];
    
    self.requestStatusCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        RACSignal *signal   = [ZXRequestManager getWithURL:@"http://www.jiuyunda.net:90/api/v1/order/order_track" withParamater:@{@"orderid":self.order.id}];
        [signal subscribeNext:^(id x) {
            NSLog(@"%@",x);
            if ([x[@"code"] integerValue] == 100)
            {
                NSArray *data = x[@"data"];
                NSMutableArray *array = @[].mutableCopy;
                for (NSDictionary *dic in data)
                {
                    [array addObject:dic];
                }
                self.statusArray = array;
            }
            UITableView *tableView = input;
            if (tableView.mj_header.isRefreshing)
            {
                [tableView.mj_header endRefreshing];
            }
        }];
        return [RACSignal empty];
    }];
    
}


@end
