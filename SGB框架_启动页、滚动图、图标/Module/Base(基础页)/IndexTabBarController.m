//
//  IndexTabBarController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/1.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "IndexTabBarController.h"
#import "UITabBarController+CutomTabBar.h"
@interface IndexTabBarController ()

@end

@implementation IndexTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customIndexTabBar];
    
    //3 设置NavigationBar
    
}
#pragma mark - 1自定义tabBar
- (void)customIndexTabBar
{
    //自定义首页tabBar
    
    //1. 设置正常图标选中图标
    //10 设置图标数组
    NSArray *arr_image = @[@"tabbar_index_",@"tabbar_radio_",@"tabbar_doctor_",@"tabbar_me_",@"tabbar_doctor_",@"tabbar_radio_",@"tabbar_index_",@"tabbar_doctor_",@"tabbar_radio_",@"tabbar_index_",@"tabbar_me_",@"tabbar_index_"];
    //11 设置标题
    NSArray *arr_title = @[@"首页",@"NAV",@"约束",@"登录",@"SearchDisplay",@"聚光灯",@"网页",@"传值",@"接口测试",@"轮播",@"iOS9适配",@"多重选择"];
    [self tabBarWithImageArray:arr_image titleArray:arr_title selectedColor:[UIColor greenColor]];
    
}


@end
