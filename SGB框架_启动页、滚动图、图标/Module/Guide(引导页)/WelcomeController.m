//
//  WelcomeController.m
//  欧了
//
//  Created by ST on 15/8/27.
//  Copyright (c) 2015年 山东开创集团. All rights reserved.
//

#import "WelcomeController.h"
#import "UIView+STKit.h"
#import "IndexViewController.h"
#import "AppDelegate.h"

@interface WelcomeController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView  *scrollView; //
@property (nonatomic, strong) UIPageControl *pageControl; //


@end

@implementation WelcomeController

#pragma mark - lift cycle 生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Delegate 视图委托
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

#pragma mark - event response 事件相应
- (void)gotoMain
{
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:[IndexViewController new]];
    ApplicationDelegate.window.rootViewController = navVC;
}
#pragma mark - private methods 私有方法

- (void)setupUI
{
    // 1.添加图片
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        NSString *imageName = [NSString stringWithFormat:@"w0%@.jpg", @(i+1)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [self.scrollView addSubview:imageView];
    }
    
    // 2.添加按钮
    CGFloat buttonW = 200;
    CGFloat buttonH = 44;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, buttonW, buttonH)];
    [button setCenterX:4.5 * ScreenWidth];
    [button setCenterY:ScreenHeight - 70];
    [button createBordersWithColor:[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1] andCornerRadius:buttonH/2 andWidth:1];
    [button setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.8]];
    [button setTitle:@"欢迎进入开创" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gotoMain) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button];
    
    
    [self.view addSubview:self.pageControl];
}

#pragma mark - getters and setters 属性

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setContentSize:CGSizeMake(5*ScreenWidth, 0)];
        [_scrollView setDelegate:self];
        [_scrollView setBounces:NO];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [UIPageControl new];
        [_pageControl setNumberOfPages:5];
        _pageControl.centerY = ScreenHeight - 20;
        _pageControl.centerX = ScreenWidth/2;
    }
    return _pageControl;
}
@end
