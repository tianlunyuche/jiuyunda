//
//  ZXSetupTableViewCell.h
//  WineShopping
//
//  Created by xinying on 2017/4/18.
//  Copyright © 2017年 habav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXSetupTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *w_titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *w_subTitle;
@property (weak, nonatomic) IBOutlet UIImageView *w_imageView;


/**
 * 刷新
 */
- (void)updateTitle:(NSString *)title subTitle:(NSString *)subtitle;
@end
