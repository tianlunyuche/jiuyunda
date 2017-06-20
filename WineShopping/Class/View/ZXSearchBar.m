//
//  ZXSearchBar.m
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXSearchBar.h"

@interface ZXSearchBar ()

@property(nonatomic,strong)UIView *view;

@end

@implementation ZXSearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame])
    {
        [self configView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configView{
    
    _searchBar      = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kWidth - 100, 30)];
    _searchBar.placeholder       = @"搜索";
    _searchBar.backgroundColor =kRGBColor(255, 255, 255);
    _searchBar.tintColor =kRGBColor(255, 255, 255);
    _searchBar.backgroundColor =[UIColor clearColor];
    [_searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:kRGBAColor(255, 255, 255, 0) size:CGSizeMake(kWidth -160, 30)] forState:UIControlStateNormal];
    
    for (UIView *subview in _searchBar.subviews) {
        for (UIView *grandSonView in subview.subviews) {
            if ([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                grandSonView.backgroundColor =kRGBAColor(255, 255, 255, 0);
                grandSonView.alpha =0;
            }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField'")]){
                grandSonView.backgroundColor =kRGBAColor(245, 245, 245, 0);
                
                self.view =grandSonView;
                ZXLog(@"Keep textfiedld bkg color");
            }else{
                //                grandSonView.backgroundColor = [UIColor whiteColor];
                grandSonView.backgroundColor =kRGBAColor(255, 255, 255, 0);
                //                grandSonView.alpha          = 0.6;
            }
        }
    }
    UITextField *searchField =[_searchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self addSubview:_searchBar];
    self.backgroundColor =[UIColor clearColor];
    
    self.layer.cornerRadius =5;
    self.layer.masksToBounds =YES;
    _searchBar.layer.cornerRadius =5;
    _searchBar.layer.masksToBounds =YES;
}

- (void)setBgColor:(UIColor *)bgColor{
    
    _bgColor =bgColor;
    self.view.backgroundColor =bgColor;
}



@end
