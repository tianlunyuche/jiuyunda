//
//  ZXTabBarController.m
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXTabBarController.h"
#import "ZXNavigationController.h"
#import "ZXHomeVC.h"
#import "ZXCategoryVC.h"
#import "ZXFoundVC.h"
#import "ZXShoppingCarVC.h"
#import "ZXMeVC.h"

#import "ZXHomeViewModel.h"
#import "ZXCategoryViewModel.h"
#import "ZXFoundViewModel.h"
#import "ZXShoppingCarViewModel.h"
#import "ZXMeViewModel.h"

@interface ZXTabBarController ()

@end

@implementation ZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChileVC];
}

- (void)addChileVC{
    
    ZXHomeVC *homeVC           = [[ZXHomeVC alloc]initWithViewModel:[[ZXHomeViewModel alloc]initWithService:nil params:@{@"title":@"首页"}]];
    ZXNavigationController *nav1 = [self setChildVC:homeVC title:@"首页" imageName:@"homeNormal" withSelectedName:@"homeHight"];
    
    ZXCategoryVC *cateVC       = [[ZXCategoryVC alloc]initWithViewModel:[[ZXCategoryViewModel alloc]initWithService:nil params:@{@"title":@"分类"}]];
    ZXNavigationController *nav2 =  [self setChildVC:cateVC title:@"分类" imageName:@"categoryNormal" withSelectedName:@"categoryHight"];
    
    ZXFoundVC *foundVC         = [[ZXFoundVC alloc]initWithViewModel:[[ZXFoundViewModel alloc]initWithService:nil params:@{@"title":@"发现"}]];
    ZXNavigationController *nav3 =   [self setChildVC:foundVC title:@"发现" imageName:@"foundNormal" withSelectedName:@"foundHight"];
    
    ZXShoppingCarVC *shopVC    = [[ZXShoppingCarVC alloc]initWithViewModel:[[ZXShoppingCarViewModel alloc]initWithService:nil params:@{@"title":@"购物车"}]];
    ZXNavigationController *nav4 =  [self setChildVC:shopVC title:@"购物车" imageName:@"carNormal" withSelectedName:@"carHight"];
    
    ZXMeVC *meVC               = [[ZXMeVC alloc]initWithViewModel:[[ZXMeViewModel alloc]initWithService:nil params:@{@"title":@"我的"}]];
    ZXNavigationController *nav5 =  [self setChildVC:meVC title:@"我的" imageName:@"meNoraml" withSelectedName:@"meHight"];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
}

- (ZXNavigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imgName withSelectedName:(NSString *)selectedName
{
    vc.title                = title;
    vc.tabBarItem.image     = [UIImage imageNamed:imgName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    
    vc.tabBarController.tabBar.tintColor   = THEME_COLOR;
    
    NSDictionary *dic       = @{NSForegroundColorAttributeName:BLACK_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSDictionary *selectDic = @{NSForegroundColorAttributeName:THEME_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    
    return [[ZXNavigationController alloc]initWithRootViewController:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
