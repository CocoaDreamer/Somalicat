//
//  MForgetPWController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/8.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "MForgetPWController.h"

@interface MForgetPWController ()

@end

@implementation MForgetPWController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //忘记密码
    DJRegisterView *djzcView = [[DJRegisterView alloc]
                                initwithFrame:self.view.bounds djRegisterViewTypeSMS:DJRegisterViewTypeNoScanfSMS plTitle:@"请输入验证码"
                                title:@"提交"
                                
                                
                                hq:^BOOL(NSString *phoneStr) {
                                 
                                    if ([Utility isBlankString:phoneStr]) {
                                        return NO;
                                    }
                                    return YES;
                                }
                                
                                tjAction:^(NSString *yzmStr) {
                                    
                                }];
    [self.view addSubview:djzcView];
    
    
    
    /**
     * 重设密码
     */
    
//    DJRegisterView *djSetPassView = [[DJRegisterView alloc]
//                                     initwithFrame:self.view.bounds action:^(NSString *key1, NSString *key2) {
//                                         NSLog(@"%@%@",key1,key2);
//                                         
//                                     }];
//    [self.view addSubview:djSetPassView];
    
}


@end
