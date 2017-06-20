//
//  ZXAddressTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/26.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXAddressTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *w_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *w_phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *w_addresslabel;

@property(nonatomic,strong)RACSubject   *subject;

- (void)updateAddress:(ZXAddress *)address;

@end
