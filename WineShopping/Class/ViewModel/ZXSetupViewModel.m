//
//  ZXSetupViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/27.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXSetupViewModel.h"
#import "ZXFunctionViewModel.h"
#import "ZXAboutMeView.h"
#import "ZXPsdManagerViewModel.h"

@implementation ZXSetupViewModel

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
    self.cellClickSubject   = [RACSubject subject];
    [self.cellClickSubject subscribeNext:^(id x) {
        ZXLog(@"%@",x);
        NSInteger tag = [x[0] integerValue];
        switch (tag)
        {
            case 0:
            {
                if ([[ZXTool getCacheSize] floatValue] == 0)
                {
                    SHOW_ERROE(@"暂无要清除的内容");
                    DISMISS_SVP(1.2);
                }
                else
                {
                    [[SDWebImageManager sharedManager] cancelAll];
                    [[SDWebImageManager sharedManager].imageCache clearMemory];
                    [[SDWebImageManager sharedManager].imageCache clearDisk];
                    SHOW_SUCCESS(@"清除完成");
                    DISMISS_SVP(1.3);
                    UITableView *table = x[1];
                    [table reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
                }
            }
                break;
            case 1:
            {
                //                功能
                ZXFunctionViewModel *viewModel = [[ZXFunctionViewModel alloc]initWithService:self.services params:@{@"title":@"功能"}];
                self.naviImpl.className         = @"ZXFunctionVC";
                [self.naviImpl pushViewModel:viewModel animated:YES];
            }
                break;
            case 2:
            {
                //                关于
                ZXAboutMeView *aboutView       = [[ZXAboutMeView alloc]initWithFrame:CGRectMake(kWidth / 6.0 , kHeight / 3.0, kWidth / 3.0 * 2.0, kWidth / 3.0 * 2.0 + 30) withTitleArray:@[@"确定"]];
                [[[UIApplication sharedApplication].delegate window] addSubview:aboutView];
            }
                break;
            case 3:
            {
                //                帮助中心
                ZXLog(@"帮助中心");
                
            }
                break;
            case 4:
            {
                //                密码管理
                ZXPsdManagerViewModel *viewModel = [[ZXPsdManagerViewModel alloc]initWithService:self.services params:@{@"title":@"密码修改"}];
                self.naviImpl.className         = @"ZXPsdManagerVC";
                [self.naviImpl pushViewModel:viewModel animated:YES];
            }
                break;
                
            default:
                break;
        }
        
        
    }];
    
    self.exitSubject        = [RACSubject subject];
    [self.exitSubject subscribeNext:^(id x) {
        UITableView *tableView = x;
        [ZXTool exit];
        [tableView reloadData];
    }];
}


@end
