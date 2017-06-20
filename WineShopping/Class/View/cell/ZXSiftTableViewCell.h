//
//  ZXSiftTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXSiftModel;

@interface ZXSiftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *w_Label;

@property (weak, nonatomic) IBOutlet UIImageView *w_imageView;

- (void)updateWithModel:(ZXSiftModel *)model;

@end
