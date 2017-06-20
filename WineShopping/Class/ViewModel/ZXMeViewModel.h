//
//  ZXMeViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

/**
 *  个人信息，评价中心,意见反馈
 **/

@interface ZXMeViewModel : ZXBasedViewModel

/**cell点击*/
@property(nonatomic,strong)RACSubject   *cellClickSubject;

/**head点击*/
@property(nonatomic,strong)RACSubject   *headClickSubject;

/**设置*/
@property(nonatomic,strong)RACSubject   *setUpSubject;

@end
