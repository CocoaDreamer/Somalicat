//
//  MLoginViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/8.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "MLoginViewController.h"

@interface MLoginViewController ()


@end

@implementation MLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //0 按钮返回
    __weak MLoginViewController *weakSelf = self;
    [self setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 30, 30) image:@"nav_arrow_left" selectImage:nil action:^(WRBButton *button) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    
    //1 按钮登录
    DJRegisterView *registerView = [[DJRegisterView alloc]
                                    initwithFrame:
                                    self.view.bounds
                                    djRegisterViewType:DJRegisterViewTypeNav action:^(NSString *acc, NSString *key) {
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    } zcAction:^{

                                        [self performSegueWithIdentifier:@"SegueMRegister" sender:self];
                                    } wjAction:^{
                                        
                                        [self performSegueWithIdentifier:@"SegueMForgetPW" sender:self];
                                    }];
    [self.view addSubview:registerView];
    
   
    
    //显示层
}






@end
