//
//  NavSettingController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/7.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "NavSettingController.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface NavSettingController ()

@end

@implementation NavSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"NAV";
    [self setNavigationBarBackgroundImage:@""];
    
    WS(weakSelf);
    //0 左边按钮 只有图片
    [self setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 30, 30) image:@"tabbar_doctor_normal" selectImage:@"" action:^(WRBButton *button) {
        
        
        
        [ShowMessage showTextOnly:@"我是左边按钮" messageView:weakSelf.view];
        NSLog(@"************");
        NSLog(@"***我是左边按钮");
        NSLog(@"************");
    }];
    
    
    //1 右边按钮
    [self setRightBarButtonItemWithFrame:CGRectMake(0, 0, 60, 30) title:@"右侧" titleColor:[UIColor whiteColor] image:@"tabbar_index_normal" imageInsets:UIEdgeInsetsMake(0, 0, 0, 0) backImage:@"" selectBackImage:nil action:^(WRBButton *button) {
        
        [ShowMessage showTextOnly:@"我是右边按钮" messageView:weakSelf.view];
        NSLog(@"************");
        NSLog(@"***我是右边按钮");
        NSLog(@"************");
    }];
    
    
    //2标题分段
    [self setSegmentTitleViewWithItems:@[@"1",@"2",@"3"] action:^(SGBSegControl *segControl) {
        
    }];
    
    
    
}

@end
