//
//  ZXCommentTableView.m
//  WineShopping
//
//  Created by xinying on 2017/4/20.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXCommentTableView.h"
#import "ZXCommentTableViewCell.h"
#import "ZXComment.h"

@interface ZXCommentTableView ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource>

@property(nonatomic,strong)NSMutableDictionary *heightDic;

@property(nonatomic,strong)UIView               *headerView;

@end

@implementation ZXCommentTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        [self configView];
    }
    return self;
}
- (void)configView
{
    self.dataSource     = self;
    self.delegate       = self;
    self.emptyDataSetSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[ZXCommentTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray = dataArray;
    [self reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ZXComment *commment = self.dataArray[indexPath.row];
    [cell updateWithComment:commment];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    
    ZXComment *comment = self.dataArray[indexPath.row];
    height = [ZXTool calculateStringHeight:comment.content withFont:[UIFont zxNormalFont:16] stringWidth:kWidth - 30] + 215;
    if (comment.content.length <= 0)
    {
        height = 215;
    }
    if (comment.pic_path.count > 0)
    {
        height = [ZXTool calculateStringHeight:comment.content withFont:[UIFont zxNormalFont:16] stringWidth:kWidth - 30] + 285;
    }
    
    
    return height;
}

#pragma mark - DZNEmptyData

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    [[ZXNetWork shareInstance] initNetWork];
    if ([ZXNetWork shareInstance].isNetReachable)
    {
        return [UIImage imageNamed:@"NotWorkViews"];
    }
    return [UIImage imageNamed:@"w_no_msg"];
}
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    [[ZXNetWork shareInstance] initNetWork];
    if ([ZXNetWork shareInstance].isNetReachable)
    {
        return [[NSAttributedString alloc]initWithString:@""];
    }
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"还没有评论哦"];
    [string addAttribute:NSForegroundColorAttributeName value:kRGBAColor(70, 70, 70, 1) range:NSMakeRange(0, 6)];
    
    return string;
}

#pragma mark - lazyLoad

- (NSMutableDictionary *)heightDic
{
    if (!_heightDic)
    {
        _heightDic = @{}.mutableCopy;
    }
    return _heightDic;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
