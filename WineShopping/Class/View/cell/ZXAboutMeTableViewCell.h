//
//  ZXAboutMeTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXAboutMeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *w_Label;
@property (weak, nonatomic) IBOutlet UIImageView *w_imageView;
@property (weak, nonatomic) IBOutlet UILabel *w_subLabel;


- (void)updateWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
