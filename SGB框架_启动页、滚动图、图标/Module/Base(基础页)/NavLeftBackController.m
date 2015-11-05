//
//  NavLeftBackController.m
//  IBeiGuo
//
//  Created by SGB on 15/3/17.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import "NavLeftBackController.h"

@interface NavLeftBackController ()

@end

@implementation NavLeftBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**
     * 0 返回 左上角一级一级的返回按钮
     */
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];//商城首页
    [self createNavLeftItemBack];
    
}
- (void)createNavLeftItemBack
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn setImage:[UIImage imageNamed:@"nav_arrow_left"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btn_return) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item_left = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item_left;
}
- (void)btn_return
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
