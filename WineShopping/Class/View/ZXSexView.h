//
//  ZXSexView.h
//  WineShopping
//
//  Created by xinying on 2017/4/22.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXSexView : UIView

@property(nonatomic,strong)RACSubject *subject;

///性别 YES-男 NO-女
@property(nonatomic,assign)BOOL     w_sex;

@end
