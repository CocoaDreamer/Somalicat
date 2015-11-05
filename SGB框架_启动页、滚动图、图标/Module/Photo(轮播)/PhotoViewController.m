//
//  PhotoViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/23.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "PhotoViewController.h"
#import "HADirect.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HADirect *photo_ad = [HADirect direcWithtFrame:CGRectMake(0, 0, ScreenWidth, 200) ImageArr:@[@"1",@"2"] AndImageClickBlock:^(NSInteger index) {
        NSLog(@"************");
        NSLog(@"****%ld",index);
        NSLog(@"************");
    }];
    photo_ad.backgroundColor = [UIColor blueColor];
    [self.view addSubview:photo_ad];
}

@end
