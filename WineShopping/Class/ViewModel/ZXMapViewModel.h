//
//  ZXMapViewModel.h
//  WineShopping
//
//  Created by xinying on 2017/4/23.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXBasedViewModel.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>

@interface ZXMapViewModel : ZXBasedViewModel <BMKPoiSearchDelegate,BMKMapViewDelegate,BMKGeoCodeSearchDelegate>
///周边检索
@property(nonatomic,strong)RACCommand       *searchCommand;

///选择地址
@property(nonatomic,strong)RACCommand       *cellClick;

///代理
@property(nonatomic,strong)RACSubject       *addressSubject;

@end
