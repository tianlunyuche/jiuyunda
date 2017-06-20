//
//  ZXCommentCenterVC.m
//  WineShopping
//
//  Created by xinying on 2017/5/3.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXCommentCenterVC.h"
#import "ZXCommentCenterViewModel.h"
#import "ZXCommentCenterTableViewCell.h"
#import "ZXOrderModel.h"

@interface ZXCommentCenterVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)ZXCommentCenterViewModel *viewModel;

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray   *dataArray;

@end

@implementation ZXCommentCenterVC

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self bindViewModel];
    [self resetNavi];
    [self initView];
    
}
- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self);
    //监听取消返回事件
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"wtk_cancelPop" object:nil] subscribeNext:^(id x) {
        @strongify(self);
        [self resetNavi];
    }];
    RAC(self,dataArray)             = RACObserve(self.viewModel, dataArray);
    self.tableView.mj_header        = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.refreshCommand execute:self.tableView];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)initView
{
    [self.view addSubview:self.tableView];
    self.tableView.delegate         = self;
    self.tableView.dataSource       = self;
    self.tableView.rowHeight        = 120;
    [self.tableView registerClass:[ZXCommentCenterTableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray=  dataArray;
    [self.tableView reloadData];
}

- (void)resetNavi
{
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:kRGBAColor(70, 70, 70, 1)};
}
#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel.cellClickCommand execute:self.dataArray[indexPath.row]];
}

#pragma mark tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @weakify(self);
    ZXCommentCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ZXOrderModel *model = self.dataArray[indexPath.row];
    [cell updateWithOrder:model];
    //  commentBtnClick
    [cell.commentSubject subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.commentCommand execute:self.dataArray[indexPath.row]];
    }];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

#pragma mark - lazyLoad
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
