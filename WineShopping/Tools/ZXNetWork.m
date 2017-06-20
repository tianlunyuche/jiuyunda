//
//  ZXNetWork.m
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXNetWork.h"
#import "Reachability.h"

@interface ZXNetWork ()

@property(nonatomic,strong)Reachability *hostReach;
@property(nonatomic,strong)Reachability *internetReachability;

@end

@implementation ZXNetWork

+ (instancetype)shareInstance;{
    
    static ZXNetWork *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =[[ZXNetWork alloc] init];
    });
    return manager;
}

- (void)initNetWork{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReach =[Reachability reachabilityWithAddress:@"https://www.baidu.com"];
    [self.hostReach startNotifier];
    [self updateInterfaceWithReachability:self.hostReach];
    
    self.internetReachability =[Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
}

- (void)reachabilityChanged:(NSNotification *)note{
    Reachability *curReach =[note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability{
    self.isNetReachable =NO;
    if (reachability ==self.hostReach) {
        BOOL connectionRequired =[reachability connectionRequired];
        if (connectionRequired) {
            self.isNetReachable =YES;
        }else{
            self.isNetReachable =NO;
            [self noNet];
        }
    }else{
        NetworkStatus netStatus =[reachability currentReachabilityStatus];
        if (netStatus ==NotReachable) {
            self.isNetReachable =YES;
        }else{
            self.isNetReachable =NO;
            [self noNet];
        }
    }
}


- (BOOL)isNetReachable
{
    [self initNetWork];
    return _isNetReachable;
}

- (void)noNet{
    [SVProgressHUD showImage:[UIImage imageNamed:@"w_nonet"] status:@"网络不好"];
    DISMISS_SVP(1.2);
}

@end
