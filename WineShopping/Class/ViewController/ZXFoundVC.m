//
//  ZXFoundVC.m
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXFoundVC.h"

@implementation ZXFoundVC
#pragma mark - lifeCycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"userinfo_id"] = CURRENT_USER.bid;
    dic[@"product_id"] = @"5757ec4baf48430bef628827";
    dic[@"page"] = @1;
    dic[@"level"] = @2;
    [[ZXRequestManager getWithURL:@"http://www.jiuyunda.net:90/api/v1/productComment/comment_list" withParamater:dic] subscribeNext:^(id x) {
        ZXLog(@"评论----%@",x);
    }];
    
        [[ZXRequestManager postArrayDataWithURL:Home_Data withpramater:nil] subscribeNext:^(id x) {
            NSArray *array = x;
            for (NSDictionary *dic in array)
            {
                ZXGood *good = [[ZXGood alloc]initWithDic:dic];
                NSMutableDictionary *dic = @{}.mutableCopy;
                dic[@"userinfo_id"] = CURRENT_USER.bid;
                dic[@"product_id"] = good.id;
                dic[@"page"] = @1;
                dic[@"level"] = @0;
                [[ZXRequestManager getWithURL:@"http://www.jiuyunda.net:90/api/v1/productComment/comment_list" withParamater:dic] subscribeNext:^(id x) {
                    NSDictionary *dic1 = x[@"data"];
                    NSArray *numArray = dic1[@"comment_list"];
                    ZXLog(@"id-%@-tu-%@---num = %@",good.id,good.title,dic1[@"comment_count"][@"whole"]);
                }];
    
            }
        }];
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
