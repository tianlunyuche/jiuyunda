//
//  ZXMeViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXMeViewModel.h"
#import "ZXOrderViewModel.h"
#import "ZXRecommendViewModel.h"
#import "ZXLoginViewModel.h"
#import "ZXWebViewModel.h"
#import "ZXSetupViewModel.h"
#import "ZXFeedBackViewModel.h"
#import "ZXAboutMeViewModel.h"
#import "ZXCommentCenterViewModel.h"

@implementation ZXMeViewModel

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
    
    self.setUpSubject       = [RACSubject subject];
    [self.setUpSubject subscribeNext:^(id x) {
        ZXLog(@"设置");
        ZXSetupViewModel *viewModel    = [[ZXSetupViewModel alloc]initWithService:self.services params:@{@"title":@"设置"}];
        self.naviImpl.className         = @"ZXSetUpVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
    }];
    
    self.cellClickSubject   = [RACSubject subject];
    [self.cellClickSubject subscribeNext:^(id x) {
        ZXLog(@"cell点击%@",x);
        NSInteger num = [x integerValue];
        switch (num) {
            case 0:
            {
                //                全部订单
                ZXOrderViewModel *viewModel = [[ZXOrderViewModel alloc]initWithService:self.services params:@{@"title":@"全部订单"}];
                viewModel.orderType = 0;
                self.naviImpl.className = @"ZXOrderVC";
                [self.naviImpl pushViewModel:viewModel animated:YES];
            }
                break;
            case 1:
            {
                //                钱包查看明细
                [SVProgressHUD showImage:[UIImage imageNamed:@"w_error"] status:@"敬请期待"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                });
            }
                break;
            case 2:
            {
                //                推荐有奖
                ZXRecommendViewModel *viewModel    = [[ZXRecommendViewModel alloc]initWithService:self.services params:@{@"title":@"推荐有奖"}];
                self.naviImpl.className             = @"ZXRecommendVC";
                [self.naviImpl pushViewModel:viewModel animated:YES];
            }
                break;
            case 3:
            {
                //                意见反馈
                ZXFeedBackViewModel *viewModel     = [[ZXFeedBackViewModel alloc]initWithService:self.services params:@{@"title":@"意见反馈"}];
                self.naviImpl.className             = @"ZXFeedbackVC";
                [self.naviImpl pushViewModel:viewModel animated:YES];
            }
            case 4:
            {
                //                客服热线
                ZXLog(@"客服热线");
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
                
            }
                break;
            case 5:
            {
                //                酒运达官网
                ZXWebViewModel *viewModel  = [[ZXWebViewModel alloc]initWithService:self.services params:@{@"title":@"酒运达"}];
                viewModel.urlString         = @"http://a.eqxiu.com/s/dH91BoVd";
                self.naviImpl.className     = @"ZXWebVC";
                [self.naviImpl pushViewModel:viewModel animated:YES];
            }
                break;
                
            default:
                break;
        }
    }];
    
    self.headClickSubject = [RACSubject subject];
    [self.headClickSubject subscribeNext:^(id x) {
        ZXLog(@"head点击%@",x);
        NSInteger num = [x integerValue];
        switch (num) {
            case 4:
            {
                //                积分
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
            case 5:
            {
                //                酒库
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
            case 6:
            {
                //                优惠券
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
            case 7:
            {
                //                酒券
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
            case 8:
            {
                //                点击头像
                if ([self judgeWhetherLogin:YES])
                {
                    ZXLog(@"YES");
                    ZXAboutMeViewModel *viewModel = [[ZXAboutMeViewModel alloc]initWithService:self.services params:@{@"title":@"我的信息"}];
                    self.naviImpl.className = @"ZXAboutMeVC";
                    [self.naviImpl pushViewModel:viewModel animated:YES];
                }
                else
                {
                    ZXLog(@"no");
                }
            }
                break;
            case 9:
            {
                //                收藏
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
            case 10:
            {
                //                足迹
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
                
            default:
            {
                //                订单
                NSArray *arr = @[@"待支付",@"配送中",@"待配送",@"待评价"];
                if (num == 3)
                {
                    ZXCommentCenterViewModel *viewModel = [[ZXCommentCenterViewModel alloc]initWithService:self.services params:@{@"title":@"评价中心"}];
                    self.naviImpl.className = @"ZXCommentCenterVC";
                    [self.naviImpl pushViewModel:viewModel animated:YES];
                }
                else
                {
                    ZXOrderViewModel *viewModel = [[ZXOrderViewModel alloc]initWithService:self.services params:@{@"title":arr[num]}];
                    viewModel.orderType = num + 1;
                    self.naviImpl.className = @"ZXOrderVC";
                    [self.naviImpl pushViewModel:viewModel animated:YES];
                }
                
            }
                break;
        }
    }];
}

@end
