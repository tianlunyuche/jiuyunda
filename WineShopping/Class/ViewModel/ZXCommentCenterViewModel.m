//
//  ZXCommentCenterViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/5/1.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXCommentCenterViewModel.h"
#import "ZXOrderModel.h"
#import "ZXOrderDetailViewModel.h"
#import "ZXCommentViewModel.h"

@implementation ZXCommentCenterViewModel

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
    self.refreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        SHOW_SVP(@"加载中")
        RACSignal *signal = [ZXRequestManager postArrayDataWithURL:@"AllOrder" withpramater:@{}];
        [signal subscribeNext:^(id x) {
            DISMISS_SVP(0.01);
            UITableView *table = input;
            if (table.mj_header.isRefreshing)
            {
                [table.mj_header endRefreshing];
            }
            NSArray *xArray = x;
            NSMutableArray *mArray = @[].mutableCopy;
            for (NSDictionary *dic in xArray)
            {
                ZXOrderModel *order = [[ZXOrderModel alloc]initWithDic:dic];
                [mArray addObject:order];
            }
            self.dataArray = mArray;
        }];
        return [RACSignal empty];
    }];
    
    self.cellClickCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        ZXOrderDetailViewModel *viewModel = [[ZXOrderDetailViewModel alloc]initWithService:self.services params:@{@"title":@"订单详情"}];
        viewModel.order = input;
        self.naviImpl.className = @"ZXOrderDetailVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
    
    self.commentCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        ZXCommentViewModel *viewModel = [[ZXCommentViewModel alloc]initWithService:self.services params:@{@"title":@"评价"}];
        viewModel.order = input;
        self.naviImpl.className = @"ZXCommentVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}



#pragma lazyLoad
-(NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

@end
