//
//  ZXViewModelNavigationImpl.h
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXViewModelNavigationImpl : NSObject<ZXViewModelServices>

@property(nonatomic,copy)NSString *className;
//设置当前rootVC
@property(nonatomic,assign)NSInteger selectedIndex;

- (instancetype)initWithNavigationController:(UINavigationController *)navi;

@end
