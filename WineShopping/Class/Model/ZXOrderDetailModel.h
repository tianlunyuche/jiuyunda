//
//  ZXOrderDetailModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/18.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXOrderDetailModel : NSObject
@property (nonatomic,strong)NSString *avatar_url;

@property (nonatomic,strong)NSString *integral;

@property (nonatomic,strong)NSString *order_id;

@property (nonatomic,assign)float price;

@property (nonatomic,strong)NSString *qrcode;

@property (nonatomic,assign)int quantity;

@property (nonatomic,strong)NSString *specification;

@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSString *ordercompleted_id;

@property (nonatomic, assign) BOOL is_gift;

@property (nonatomic, assign) NSInteger purchasePrice;

@property (nonatomic, copy) NSString* product_id;


@end
