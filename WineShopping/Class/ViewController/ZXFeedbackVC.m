//
//  ZXFeedbackVC.m
//  WineShopping
//
//  Created by xinying on 2017/5/10.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXFeedbackVC.h"
#import "ZXFeedBackViewModel.h"
#import "ZXTextView.h"
#import "ZXDropView.h"

#define MENU_TAG 145

@interface ZXFeedbackVC ()

@property(nonatomic,strong)ZXFeedBackViewModel *viewModel;

@property(nonatomic,strong)UIButton             *menuBtn;

@property(nonatomic,strong)UILabel              *ideaLabel;

@property(nonatomic,strong)ZXTextView          *textView;

@property(nonatomic,strong)UITextField          *phoneTXF;

@property(nonatomic,strong)UIImageView          *iconImageView;

@property(nonatomic,strong)ZXDropView          *menuView;

@end

@implementation ZXFeedbackVC

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self initView];
    [self resetRightNavi];
}

- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self);
    [[self.menuBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self beginAnimation];
        [self changMenuView];
    }];
    [self.menuView.clickSubject subscribeNext:^(id x) {
        @strongify(self);
        self.ideaLabel.text = x[@"title"];
    }];
    [self.menuView.dismissSubject subscribeNext:^(id x) {
        @strongify(self);
        [self beginAnimation];
    }];
    
}

- (void)resetRightNavi
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:kRGBAColor(70, 70, 70, 1)};
    
    UIButton *rightBtn                  = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame                      = CGRectMake(0, 0, 40, 18);
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [rightBtn setTitleColor:kRGBAColor(70, 70, 70, 1) forState:UIControlStateNormal];
    rightBtn.titleLabel.font            = [UIFont zxNormalFont:15];
    rightBtn.titleLabel.textAlignment   = NSTextAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
}
///提交
- (void)submit
{
    [self.viewModel.submitConmand execute:@{@"idea":self.textView.text,@"phone":self.phoneTXF.text}];
}
///箭头做动画  添加移除menuView
- (void)beginAnimation
{
    @weakify(self);
    [UIView animateWithDuration:0.7
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         @strongify(self);
                         self.iconImageView.transform = CGAffineTransformRotate(self.iconImageView.transform, M_PI);
                     }
                     completion:^(BOOL finished) {
                     }];
}
- (void)changMenuView
{
    if ([self.view viewWithTag:MENU_TAG])
    {
        [self.menuView dismiss];
    }
    else
    {
        [self.view addSubview:self.menuView];
        [self.menuView beginAnimation];
    }
}

- (void)initView
{
    @weakify(self);
    UIView *topBG           = [[UIView alloc]init];
    topBG.backgroundColor   = [UIColor whiteColor];
    [self.view addSubview:topBG];
    [topBG mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.view).offset(25 + 64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    UILabel *label          = [[UILabel alloc]init];
    label.textColor         = kRGBAColor(70, 70, 70, 1);
    label.text              = @"意见反馈";
    label.font              = [UIFont zxNormalFont:16];
    [topBG addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topBG).offset(18);
        make.centerY.equalTo(topBG);
        make.height.mas_equalTo(30);
        make.width.equalTo(@100);
    }];
    
    self.iconImageView      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"w_xia"]];
    [topBG addSubview:self.iconImageView ];
    [self.iconImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topBG).offset(-20);
        make.centerY.equalTo(topBG);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    self.ideaLabel          = [[UILabel alloc]init];
    _ideaLabel.textColor    = kRGBAColor(100, 100, 100, 1);
    _ideaLabel.text         = @"功能意见";
    _ideaLabel.font         = [UIFont zxNormalFont:14];
    _ideaLabel.textAlignment = NSTextAlignmentRight;
    [topBG addSubview:_ideaLabel];
    [_ideaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.right.equalTo(self.iconImageView .mas_left).offset(-3);
        make.centerY.equalTo(self.iconImageView );
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(30);
    }];
    
    [topBG addSubview:self.menuBtn];
    [self.menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(_ideaLabel);
        make.right.equalTo(self.iconImageView .mas_right);
        make.centerY.equalTo(self.iconImageView );
        make.height.mas_equalTo(30);
    }];
    
    UIView *midBG           = [[UIView alloc]init];
    midBG.backgroundColor   = [UIColor whiteColor];
    [self.view addSubview:midBG];
    [midBG mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(topBG.mas_bottom).offset(15);
        make.height.mas_equalTo(kWidth / 2.5);
    }];
    
    [midBG addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(midBG);
        make.left.equalTo(midBG);
        make.size.equalTo(midBG);
    }];
    
    UIView *btomBG          = [[UIView alloc]init];
    btomBG.backgroundColor  = [UIColor whiteColor];
    [self.view addSubview:btomBG];
    [btomBG mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(midBG.mas_bottom).offset(15);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    [btomBG addSubview:self.phoneTXF];
    [self.phoneTXF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btomBG).offset(8);
        make.top.equalTo(btomBG);
        make.width.mas_equalTo(kWidth - 16);
        make.height.equalTo(btomBG);
    }];
    
    UILabel *tip            = [[UILabel alloc]init];
    tip.textColor           = kRGBAColor(80, 80, 80, 1);
    tip.text                = @"小贴士";
    tip.font                = [UIFont zxNormalFont:14];
    [self.view addSubview:tip];
    [tip mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(btomBG.mas_bottom).offset(25);
        make.left.equalTo(self.view).offset(10);
        make.width.equalTo(@100);
        make.height.mas_equalTo(20);
    }];
    UILabel *tipLabel       = [[UILabel alloc]init];
    tipLabel.textColor      = kRGBAColor(80, 80, 80, 1);
    tipLabel.text           = @"您也可以反馈意见至QQ：240394381";
    tipLabel.font           = [UIFont zxNormalFont:14];
    [tipLabel setText:@"您也可以反馈意见至QQ:240394381" Font:[UIFont zxNormalFont:14] withColor:[UIColor blueColor] Range:NSMakeRange(12, 8)];
    [self.view addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tip);
        make.top.equalTo(tip.mas_bottom).offset(10);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(20);
    }];
}

- (UIButton *)menuBtn
{
    if (!_menuBtn)
    {
        _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _menuBtn.backgroundColor = [UIColor clearColor];
    }
    return _menuBtn;
}
- (UITextView *)textView
{
    if (!_textView)
    {
        _textView = [ZXTextView textView];
        _textView.font = [UIFont zxNormalFont:16];
        _textView.placeholder = @"很高兴听到您的声音，我们将持续优化";
        
    }
    return _textView;
}

- (UITextField *)phoneTXF
{
    if (!_phoneTXF)
    {
        _phoneTXF = [[UITextField alloc]init];
        _phoneTXF.placeholder = @"输入手机号/邮箱(选填)";
        //        _phoneTXF.font = [UIFont wtkNormalFont:16];
    }
    return _phoneTXF;
}
- (ZXDropView *)menuView
{
    if (!_menuView)
    {
        _menuView = [[ZXDropView alloc]initWithFrame:CGRectMake(0, 134, kWidth, 255) withTitleArray:@[@"功能意见",@"界面意见",@"您的新需求",@"操作意见",@"流量问题",@"其他"]];
        _menuView.backgroundColor = kRGBAColor(200, 200, 200, 0.7);
    }
    return _menuView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
