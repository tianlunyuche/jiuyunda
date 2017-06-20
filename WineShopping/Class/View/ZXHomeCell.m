//
//  ZXHomeCell.m
//  WineShopping
//
//  Created by xinying on 2017/4/16.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXHomeCell.h"
#import "ZXGoodManagerView.h"

@interface ZXHomeCell ()

///商品
@property(nonatomic,strong)UIImageView  *ImageView;

///标题
@property(nonatomic,strong)UILabel      *TitleLabel;

@property(nonatomic,strong)UILabel      *DescLabel;

@property(nonatomic,strong)UILabel      *PriceLabel;

///无货
@property(nonatomic,strong)UILabel      *StockLabel;

@property(nonatomic,strong)ZXGood      *goods;

///加号减号
@property(nonatomic,strong)ZXGoodManagerView *managerView;



@end

@implementation ZXHomeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        [self configView];
        [self bind];
    }
    return self;
}

- (void)configView
{
    CGFloat width = self.bounds.size.width;
    WS(weakSelf);
    UIView *bgView                  = [[UIView alloc]init];
    bgView.backgroundColor          = [UIColor whiteColor];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
        make.size.equalTo(weakSelf);
    }];
    
    self.ImageView               = [[UIImageView alloc]init];
    [bgView addSubview:self.ImageView];
    [self.ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView);
        make.top.equalTo(bgView);
        make.width.equalTo(bgView);
        make.height.equalTo(bgView.mas_width);
    }];
    
    self.TitleLabel              = [[UILabel alloc]init];
    _TitleLabel.font             = [UIFont zxNormalFont:15];
    _TitleLabel.textColor        = kRGBAColor(40, 40, 40, 1);
    [bgView addSubview:self.TitleLabel];
    [_TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(2);
        make.top.equalTo(weakSelf.ImageView.mas_bottom).offset(5);
        make.width.mas_equalTo(width - 4);
        make.height.equalTo(@15);
    }];
    
    self.DescLabel               = [[UILabel alloc]init];
    _DescLabel.textAlignment     = NSTextAlignmentCenter;
    _DescLabel.font              = [UIFont zxNormalFont:10];
    _DescLabel.textColor         = THEME_COLOR;
    _DescLabel.layer.borderColor = THEME_COLOR.CGColor;
    _DescLabel.layer.borderWidth = 0.3;
    _DescLabel.layer.cornerRadius    = 3;
    _DescLabel.layer.masksToBounds   = YES;
    _DescLabel.text = @"精选";
    [bgView addSubview:self.DescLabel];
    
    [_DescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(2);
        make.top.equalTo(weakSelf.TitleLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(30 * ZOOM_SCALL);
        make.height.mas_equalTo(15);
    }];
    
    self.PriceLabel              = [[UILabel alloc]init];
    _PriceLabel.font             = [UIFont zxNormalFont:14];
    _PriceLabel.textColor        = THEME_COLOR;
    _PriceLabel.text             = @"¥135.00";
    [bgView addSubview:_PriceLabel];
    [_PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(1);
        make.top.equalTo(weakSelf.DescLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(100 * ZOOM_SCALL);
        make.height.equalTo(@15);
    }];
    
    self.managerView                = [[ZXGoodManagerView alloc]init];
    [bgView addSubview:self.managerView];
    [self.managerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView.mas_right).offset(0);
        make.bottom.equalTo(bgView.mas_bottom).offset(-10);
        make.width.mas_equalTo(110);
        make.height.equalTo(@40);
    }];
    
    self.StockLabel              = [[UILabel alloc]init];
    self.StockLabel.font         = [UIFont zxNormalFont:17];
    self.StockLabel.text         = @"补货中";
    self.StockLabel.textColor    = THEME_COLOR;
    _StockLabel.textAlignment    = NSTextAlignmentCenter;
    [bgView addSubview:_StockLabel];
    [_StockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.managerView);
        make.right.equalTo(weakSelf.managerView);
        make.size.equalTo(weakSelf.managerView);
    }];
}

- (void)bind
{
    
    @weakify(self);
    [RACObserve(self.managerView, num) subscribeNext:^(id x) {
        //        NSLog(@"%@",x);
    }];
    
    [self.managerView.addSubject subscribeNext:^(id x) {
        @strongify(self);
        if(!self.isSearch)
        {
            [ZXTool beginAddAnimationWithImageView:self.ImageView animationTime:0.55 startPoint:CGPointZero endPoint:CGPointZero];
        }
    }];
}


- (void)updateGood:(ZXGood *)goods
{
    //  检查购物车是否有商品
    if ([[ZXShoppingManager manager].goodsDic objectForKey:goods.id])
    {
        ZXGood *good = [[ZXShoppingManager manager].goodsDic objectForKey:goods.id];
        goods.num = good.num ;
    }
    else
    {
        //        car没有这个商品
        goods.num = 0;
    }
    
    
    self.goods = goods;
    self.TitleLabel.text = goods.title;
    self.PriceLabel.text = [NSString stringWithFormat:@"%.2f",goods.price];
    
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:goods.thumb_url] placeholderImage:[UIImage imageNamed:@"placehoder2"]];
    if (goods.stock <= 0)
    {
        self.StockLabel.hidden   = NO;
        self.managerView.hidden     = YES;
    }
    else
    {
        self.StockLabel.hidden   = YES;
        self.managerView.hidden     = NO;
        [self.managerView updateGood:goods];
    }
    
}

@end
