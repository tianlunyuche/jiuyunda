//
//  ZXHomeVC.m
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXHomeVC.h"
#import "ZXHomeCollectionView.h"
#import "ZXSearchBar.h"

@interface ZXHomeVC ()<UISearchBarDelegate>

@property(nonatomic,strong)ZXHomeViewModel *viewModel;
@property(nonatomic,strong)ZXHomeCollectionView *collectionView;
@property(nonatomic,strong)ZXSearchBar *searchBar;
@property(nonatomic,strong)UIButton *leftButton;
@property(nonatomic,strong)UIButton *rightBtn;

///是否为显示页面 (控制collectionView)
@property(nonatomic,assign)BOOL isShow;

@end

@implementation ZXHomeVC
@dynamic viewModel;
#pragma mark - lifeCycle
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.isShow =YES;
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:kRGBAColor(255, 255, 255, 0.01)] forBarMetrics:UIBarMetricsDefault];
    [self _setNavigationItem];
    self.collectionView.contentOffset =CGPointMake(self.collectionView.contentOffset.x, self.collectionView.contentOffset.y +0.02);
    [[ZXRequestManager postWithURL:@"http://localhost:7000" withParamater:@{}] subscribeNext:^(id x) {
        ZXLog(@"%@",x);
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.isShow =NO;
    self.navigationController.navigationBar.barStyle =UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:kRGBAColor(255, 255, 255, 0.99)] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelPop) name:@"wtk_cancelPop" object:nil];
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    [self bindViewModel];
    [self configView];
}

- (void)bindViewModel{
    [super bindViewModel];
    
    @weakify(self);
    //    绑定数据
    RAC(self.collectionView,headArray)  = RACObserve(self.viewModel, headData);
    RAC(self.collectionView,dataArray)  = RACObserve(self.viewModel,dataArray);
    
    self.collectionView.mj_header       = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.refreshCommand execute:self.collectionView];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    //    navi
    RAC(self ,leftButton.rac_command) =RACObserve(self.viewModel, naviCommand);
    
    [RACObserve(self.collectionView, contentOffset) subscribeNext:^(id x) {
        if (!self.isShow) {
            return ;
        }
        CGPoint point =[x CGPointValue];
        CGFloat y =point.y;
        if (y <kWidth *0.23) {
            [self.leftButton setBackgroundImage:[UIImage imageNamed:@"wtksaoyisaob"] forState:UIControlStateNormal];
            [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"xiaoxib"] forState:UIControlStateNormal];
            self.searchBar.bgColor =kRGBAColor(240, 240, 240, 0.5);
        }else{
            [self.leftButton setBackgroundImage:[UIImage imageNamed:@"wtksaoyisaoh"] forState:UIControlStateNormal];
            [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"xiaoxih"] forState:UIControlStateNormal];
            self.searchBar.bgColor = kRGBAColor(160, 160, 160, 0.5);
        }
        
        if (y <0) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        }
        else
        {
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            float a = y / kWidth / 0.23 > 0.9 ? 0.9 : y / kWidth / 0.23;
            ZXLog(@"%f",a);
            if (a < 0.9 && a >= 0)
            {
                ZXLog(@"11111");
                [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:kRGBAColor(255, 255, 255, a)] forBarMetrics:UIBarMetricsDefault];
            }
            if (a < 0.5)
            {
                ZXLog(@"22222");
                self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
            }
            else
            {
                ZXLog(@"333333");
                self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
            }
        }
    }];
    [self _setNavigationItem];
}

- (void)configView{
    
    [self.view addSubview:self.collectionView];
}


//导航
- (void)_setNavigationItem
{
    
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"wtksaoyisaoh"] forState:UIControlStateNormal];
    self.leftButton.frame = CGRectMake(0, 0, 25, 23);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"xiaoxib"] forState:UIControlStateNormal];
    self.rightBtn.frame = CGRectMake(0, 0, 25, 23);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    
    
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.center = CGPointMake(kWidth / 2.0, self.searchBar.center.y);
    
}

#pragma mark - notification
- (void)cancelPop
{
    [self _setNavigationItem];
}

#pragma mark - searchDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self.viewModel.searchSubject sendNext:@1];
    return NO;
}

#pragma mark - lazyLoad
- (ZXHomeCollectionView *)collectionView{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[ZXHomeCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 49) collectionViewLayout:layout];
        _collectionView.viewModel = self.viewModel;
    }
    return _collectionView;
}
- (UIButton *)leftButton
{
    if (!_leftButton){
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.tag = 111;
    }
    return _leftButton;
}
- (UIButton *)rightBtn{
    if (!_rightBtn)
    {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightBtn;
}

- (ZXSearchBar *)searchBar{
    if (!_searchBar)
    {
        _searchBar = [[ZXSearchBar alloc]initWithFrame:CGRectMake(0, 60, kWidth - 120, 28)];
        _searchBar.layer.cornerRadius = 5;
        _searchBar.layer.masksToBounds = YES;
        CGRect leftViewbounds = self.navigationItem.leftBarButtonItem.customView.bounds;
        CGRect rightViewbounds = self.navigationItem.rightBarButtonItem.customView.bounds;
        CGRect frame;
        CGFloat maxWidth = leftViewbounds.size.width > rightViewbounds.size.width ? leftViewbounds.size.width : rightViewbounds.size.width;
        maxWidth += 15;//leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
        frame = _searchBar.frame;
        
        frame.size.width = kWidth - maxWidth * 2;
        
        _searchBar.frame = frame;
        _searchBar.searchBar.delegate = self;
    }
    return _searchBar;
}

#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    ZXLog(@"释放了");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
