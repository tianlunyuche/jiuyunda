//
//  ZXOrderModel.m
//  WineShopping
//
//  Created by xinying on 2017/4/19.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXOrderModel.h"
#import "ZXOrderDetailModel.h"

@implementation ZXOrderModel

- (instancetype)initWithDic:(NSDictionary *)aDic
{
    self = [super init];
    if (self)
    {
        for (NSString *key in [aDic allKeys])
        {
            if ([key isEqualToString:@"ordergoods"])
            {
                NSArray *array = aDic[@"ordergoods"];
                NSMutableArray *mArray = @[].mutableCopy;
                for (NSDictionary *aDic in array)
                {
                    ZXOrderDetailModel *model = [[ZXOrderDetailModel alloc]init];
                    [model setValuesForKeysWithDictionary:aDic];
                    [mArray addObject:model];
                }
                self.ordergoods = mArray;
                
            }
            else
            {
                [self setValue:aDic[key] forKey:key];
            }
            
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
