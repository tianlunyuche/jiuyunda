//
//  ZXOrderViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXOrderViewModel.h"
#import "ZXOrderModel.h"
#import "ZXOrderDetailViewModel.h"

@interface ZXOrderViewModel ()

@property(nonatomic,assign)NSInteger selectType;

@property(nonatomic,strong)NSArray *typeArray;

@property(nonatomic,strong)NSMutableDictionary *dataDic;

@end

@implementation ZXOrderViewModel

- (instancetype)initWithService:(id<ZXViewModelServices>)service params:(NSDictionary *)params
{
    self = [super initWithService:service params:params];
    if (self)
    {
        self.selectType = 0;
        self.typeArray  = @[@"AllOrder",@"NoPayOrder",@"DeliveryOrder",@"FinshDeliveryOrder",@"FinishOrder"];
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    self.refreshCommand     = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        [SVProgressHUD showWithStatus:@"加载中"];
        RACSignal *signal = [ZXRequestManager postArrayDataWithURL:self.typeArray[self.selectType] withpramater:@{}];
        [signal subscribeNext:^(id x) {
            [SVProgressHUD dismiss];
            
            NSMutableArray *mArray = [NSMutableArray array];
            for (NSDictionary *dic in x)
            {
                ZXOrderModel *order = [[ZXOrderModel alloc]initWithDic:dic];
                [mArray addObject:order];
            }
            self.dataDic[self.typeArray[self.selectType]] = mArray;
            
            self.array = mArray;
            UITableView *tableView = input;
            if (tableView.mj_header.isRefreshing)
            {
                [tableView.mj_header endRefreshing];
            }
        }];
        return signal;
    }];
    
    self.menuClickSignal    = [RACSubject subject];
    [self.menuClickSignal subscribeNext:^(id x) {
        self.selectType     = [x integerValue];
        if (self.dataDic[self.typeArray[self.selectType]])
        {
            self.array = self.dataDic[self.typeArray[self.selectType]];
        }
        else
        {
            //            刷新
            [self.refreshCommand execute:[[UITableView alloc]init]];
        }
        [self resetTitle];
    }];
    
    //    cell
    self.cellClickCommand       = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        ZXOrderModel *order    = input;
        ZXOrderDetailViewModel *viewModel = [[ZXOrderDetailViewModel alloc]initWithService:self.services params:@{@"title":@"订单详情"}];
        viewModel.order         = order;
        self.naviImpl.className = @"ZXOrderDetailVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        
        return [RACSignal empty];
    }];
}
/**重设title*/
- (void)resetTitle
{
    self.title = self.selectType == 0 ? @"全部订单" : self.selectType == 1 ? @"待付款" : self.selectType == 2 ? @"配送中" : self.selectType == 3 ? @"已配送" : @"已完成";
}

- (NSMutableDictionary *)dataDic
{
    if (!_dataDic)
    {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}

- (NSMutableArray *)array
{
    if (!_array)
    {
        _array = [NSMutableArray array];
    }
    return _array;
}



@end
