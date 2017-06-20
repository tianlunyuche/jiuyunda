//
//  ZXShoppingCarTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/22.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXGoodManagerView;

@interface ZXShoppingCarTableViewCell : UITableViewCell

//cell0
@property (weak, nonatomic) IBOutlet UIButton *w_selectBtn;

@property (weak, nonatomic) IBOutlet UIImageView *w_goodImageView;

@property (weak, nonatomic) IBOutlet UILabel *w_titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *w_priceLabel;
@property (weak, nonatomic) IBOutlet ZXGoodManagerView *w_managView;


//cell1

@property (weak, nonatomic) IBOutlet UILabel *w_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *w_phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *w_addressLabel;

@property(nonatomic,strong)ZXAddress *address;


- (void)updateWithGood:(ZXGood *)good;

@end
