//
//  ZXPsdManagerViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/25.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"

/**
 *  密码管理（修改） 视图模型
 **/

@interface ZXPsdManagerViewModel : ZXBasedViewModel

/**原密码*/
@property(nonatomic,copy)NSString     *w_originPsd;
/**新密码*/
@property(nonatomic,copy)NSString     *w_newPsd;
/**确定*/
@property(nonatomic,copy)NSString     *w_confirmPsd;

/**是否可以更改*/
@property(nonatomic,strong)RACSignal    *canSignal;

/**确认修改*/
@property(nonatomic,strong)RACCommand   *confirmCommand;

@end
