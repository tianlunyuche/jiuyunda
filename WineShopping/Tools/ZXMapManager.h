//
//  ZXMapManager.h
//  WineShopping
//
//  Created by xinying on 2017/4/15.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface ZXMapManager : NSObject

@property(nonatomic,strong)RACSubject       *errorSubject;

///定位成功
@property(nonatomic,strong)RACSubject       *locationSubject;

///经度
@property(nonatomic,assign)double           w_lng;

///维度
@property(nonatomic,assign)double           w_lat;

+ (instancetype)manager;

///开始定位
- (void)startUserLocation;

///停止定位
- (void)stopUserLocation;

@end
