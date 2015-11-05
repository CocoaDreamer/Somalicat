//
//  PassValueController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/22.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "PassValueController.h"
#import "MyInformationView.h"
@interface PassValueController ()<MyInformationViewDelegate>

@end

@implementation PassValueController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     * 0 传值_代理
     */
    MyInformationView *view_infor = [[MyInformationView alloc]initWithFrame:CGRectMake(0, 0, 300, 600)];
    view_infor.myDelegate = self;
    [self.view addSubview:view_infor];
    
    
    
    
    
}
- (void)returnValueToShow:(NSInteger)index
{
    NSLog(@"************");
    NSLog(@"****我是序号：%ld",index);
    NSLog(@"************");
}
@end

