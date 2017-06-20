//
//  ZXCategoryRightTableView.m
//  WineShopping
//
//  Created by xinying on 2017/4/24.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXCategoryRightTableView.h"
#import "ZXCategoryRightTableViewCell.h"
#import "ZXCategoryViewModel.h"

@interface ZXCategoryRightTableView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

///是否拖拽
@property(nonatomic,assign)BOOL isDrag;

@end

@implementation ZXCategoryRightTableView

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
    self.delegate           = self;
    self.dataSource         = self;
    self.separatorStyle     = UITableViewCellSeparatorStyleNone;
    self.rowHeight          = 90;
    [self registerClass:[ZXCategoryRightTableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.isDrag && [self.dataDic allKeys].count > 0)
    {
        UITableView *tableView = (UITableView *)scrollView;
        UITableViewCell *topCell = [[tableView visibleCells] firstObject];
        NSIndexPath *indexPath = [tableView indexPathForCell:topCell];
        [self.viewModel.rightCommand execute:indexPath];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.isDrag = YES;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.dataDic[self.sectionArray[indexPath.section]];
    ZXGood *good = array[indexPath.row];
    [self.viewModel.goodCommand execute:good];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - tableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXCategoryRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *array = self.dataDic[self.sectionArray[indexPath.section]];
    ZXGood *good = array[indexPath.row];
    [cell updateGood:good];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataDic[self.sectionArray[section]];
    return array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 22.5)];
    header.backgroundColor  = kRGBAColor(242, 242, 242, 1);
    if (![header viewWithTag:111])
    {
        UILabel *label      = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 22.5)];
        label.textColor     = kRGBAColor(120, 120, 120, 1);
        label.font          = [UIFont zxNormalFont:13];
        label.text          = self.sectionArray[section];
        [header addSubview:label];
    }
    else
    {
        UILabel *label      = [header viewWithTag:111];
        label.text          = self.sectionArray[section];
    }
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 22.5;
}

- (NSArray *)sectionArray
{
    if (!_sectionArray)
    {
        _sectionArray = [NSArray array];
    }
    return _sectionArray;
}
- (NSDictionary *)dataDic
{
    if (!_dataDic)
    {
        _dataDic = [NSDictionary dictionary];
    }
    return _dataDic;
}

@end
