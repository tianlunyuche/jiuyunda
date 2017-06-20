//
//  ZXQRCodeVC.m
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXQRCodeVC.h"
#import "ZXQRCodeViewModel.h"
#import "ZXQRCode.h"

@interface ZXQRCodeVC ()

@property(nonatomic,strong)ZXQRCodeViewModel   *viewModel;

@end

@implementation ZXQRCodeVC
@dynamic viewModel;

#pragma mark - lifeCycle
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [ZXQRCode endScan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self initView];
}

- (void)initView
{
    @weakify(self);

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake((kWidth - 240) / 2.0, (kHeight - 240) / 2.0, 240, 240)];
    view.backgroundColor = [UIColor clearColor];
    view.layer.borderColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:0.8].CGColor;
    view.layer.borderWidth = 2.5;
    
    UIImageView *line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"w_scan"]];
    
    UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scanBtn.backgroundColor = THEME_COLOR;
    [scanBtn setTintColor:[UIColor whiteColor]];
    [scanBtn setTitle:@"重新扫描" forState:UIControlStateNormal];
    scanBtn.layer.cornerRadius = 8;
    scanBtn.layer.masksToBounds = YES;
    [self.view addSubview:scanBtn];
    [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-80);
        make.width.mas_equalTo(kWidth - 120);
        make.height.mas_equalTo(55);
    }];
    [[scanBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [ZXQRCode scanWithView:self withscanView:view withLineView:line withCompleteBlock:^(NSString *result) {
            [self.viewModel.scanCommand execute:result];
        }];
    }];
    
    [ZXQRCode scanWithView:self withscanView:view withLineView:line withCompleteBlock:^(NSString *result) {
        @strongify(self);
        [self.viewModel.scanCommand execute:result];
    }];
    
    
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
