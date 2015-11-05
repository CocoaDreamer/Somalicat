//
//  MRegisterViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/8.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "MRegisterViewController.h"

@interface MRegisterViewController ()

@end

@implementation MRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DJRegisterView *djzcView = [[DJRegisterView alloc]
                                initwithFrame:self.view.bounds djRegisterViewTypeSMS:DJRegisterViewTypeScanfPhoneSMS plTitle:@"请输入获取到的验证码"
                                title:@"下一步"
                                
                                hq:^BOOL(NSString *phoneStr) {
                                    
                                    return YES;
                                }
                                
                                tjAction:^(NSString *yzmStr) {
                                    
                                }];
    [self.view addSubview:djzcView];
}



@end
