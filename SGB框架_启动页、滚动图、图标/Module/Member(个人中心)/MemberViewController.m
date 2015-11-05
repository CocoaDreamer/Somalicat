//
//  MemberViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/8.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "MemberViewController.h"


#import "IANActivityIndicatorButton.h"
#import "UIButton+IANActivityView.h"

@interface MemberViewController ()
{
    IANActivityIndicatorButton *_btn;
}
@property (strong, nonatomic) UIView *view_slide;
@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //0 侧滑
    self.view_slide = [[UIView alloc]initWithFrame:CGRectMake(-ScreenWidth/2, 0, ScreenWidth/2, ScreenHeight)];
    self.view_slide.backgroundColor = [UIColor orangeColor];
    [ApplicationDelegate.window addSubview:self.view_slide];
    
    //1 登录
    __weak MemberViewController *weakSelf = self;
    [self setRightTextBarButtonItemWithFrame:CGRectMake(0, 0, 60, 30) title:@"登录" titleColor:[UIColor whiteColor] backImage:nil selectBackImage:nil action:^(WRBButton *button) {
        //登录
        [weakSelf performSegueWithIdentifier:@"SegueMLogin" sender:weakSelf];

    }];
    
    //2 消失
    
    [self setLeftTextBarButtonItemWithFrame:CGRectMake(0, 0, 50, 30) title:@"侧滑" titleColor:[UIColor whiteColor] backImage:nil selectBackImage:nil action:^(WRBButton *button) {
        //登录
        [weakSelf showSiderView];
        
    }];
    
    
    
    //3 加载button
    _btn = [[IANActivityIndicatorButton alloc] init];
    _btn.frame = CGRectMake(15, 100, self.view.bounds.size.width - 30, 80);
    _btn.backgroundColor = [UIColor redColor];
    [_btn setTitle:@"这是一个神奇的button" forState:UIControlStateNormal];
    _btn.layer.cornerRadius = 10;
    [self.view addSubview:_btn];
    _btn.tag = 2423;
//    __weak typeof(self) weakSelf = self;
    _btn.TouchBlock = ^(IANActivityIndicatorButton *myButton){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"测试:%d",myButton.tag);
        [myButton startButtonActivityIndicatorView];
        
        
        [strongSelf performSelector:@selector(after) withObject:strongSelf afterDelay:5];
    };
    
}

- (void)after
{
    [_btn endButtonActivityIndicatorView];
}

    




#pragma mark - 遮盖层
- (void)showSiderView
{
    NSTimeInterval beginAnimation = 0.5f;
    [UIView animateWithDuration:beginAnimation animations:^{
        CGRect frame = self.view_slide.frame;
        frame.origin.x = 0;
        self.view_slide.frame = frame;
    }];
}

- (void)dismissSiderView
{
    NSTimeInterval endAnimation = 0.5f;
    [UIView animateWithDuration:endAnimation animations:^{
        CGRect frame = self.view_slide.frame;
        frame.origin.x = -ScreenWidth/2;
        self.view_slide.frame = frame;
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissSiderView];
}

@end
