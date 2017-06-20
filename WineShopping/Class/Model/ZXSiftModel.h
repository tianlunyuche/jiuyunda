//
//  ZXSiftModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXSiftModel : NSObject

@property(nonatomic,copy)NSString *_id;

@property(nonatomic,copy)NSString *created_at;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *end_price;
@property(nonatomic,copy)NSString *mobile_category_id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *order;
@property(nonatomic,copy)NSString *start_price;
@property(nonatomic,copy)NSString *subtype;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *updated_at;
@property(nonatomic,copy)NSString *userinfo_id;

@property(nonatomic,assign)BOOL   isSelected;

- (instancetype)initWithDic:(NSDictionary *)dic;


@end
