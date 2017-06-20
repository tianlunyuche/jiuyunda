//
//  ZXFunctionViewModel.m
//  WineShopping
//
//  Created by xinying on 2017/5/5.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXFunctionViewModel.h"

@implementation ZXFunctionViewModel

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
    self.switchCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        UISwitch *sw = input;
        if (sw.tag == 0)
        {
            CURRENT_USER.isSound = sw.on;
        }
        else if (sw.tag == 1)
        {
            CURRENT_USER.isShake = sw.on;
        }
        else if (sw.tag == 2)
        {
            if (sw.on)
            {
                [ZXTool registTouchIDWithCompleteBlock:^(NSString *str) {
                    if ([str isEqualToString:@"验证成功"])
                    {
                        sw.on = YES;
                        SHOW_SUCCESS(@"验证成功");
                    }
                    else
                    {
                        sw.on = NO;
                        SHOW_ERROE(str);
                        DISMISS_SVP(1.3);
                    }
                }];
            }
            else
            {
                [ZXTool delegateTouchID];
            }
        }
        else
        {
            CURRENT_USER.isNight = sw.on;
            [ZXTool startNightSche];
        }
        return [RACSignal empty];
    }];
}


@end
