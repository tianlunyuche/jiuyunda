//
//  ZXTextView.m
//  WineShopping
//
//  Created by xinying on 2017/1/3.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXTextView.h"

@interface ZXTextView ()<UITextViewDelegate>

@property(nonatomic,strong)UILabel *w_label;

@end

@implementation ZXTextView

+(instancetype)textView
{
    return [[self alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initView];
        self.delegate = self;
    }
    return self;
}

- (void)initView
{
    ZXLog(@"%.2f",ZOOM_SCALL);
    self.w_label            = [[UILabel alloc]initWithFrame:CGRectMake(10 * ZOOM_SCALL, 0 * ZOOM_SCALL, 300 * ZOOM_SCALL, 30 * ZOOM_SCALL)];
    self.w_label.textColor  = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    self.w_label.font       = self.font;
    self.w_label.text       = @"placeholder";
    [self addSubview:self.w_label];
    
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    if (self.text.length == 0)
    {
        self.w_label.hidden = NO;
    }
    else
    {
        self.w_label.hidden = YES;
    }
}
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.w_label.font = font;
    self.w_label.frame = CGRectMake(10 * ZOOM_SCALL, 0 * ZOOM_SCALL, 300 * ZOOM_SCALL, (font.pointSize + 17) * ZOOM_SCALL);
}
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.w_label.text = placeholder;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (text.length == 0 && textView.text.length == 1)
    {
        self.w_label.hidden = NO;
        return YES;
    }
    if (text.length == 0 && textView.text.length == 0)
    {
        self.w_label.hidden = NO;
        return YES;
    }
    self.w_label.hidden = YES;
    return YES;
}


@end
