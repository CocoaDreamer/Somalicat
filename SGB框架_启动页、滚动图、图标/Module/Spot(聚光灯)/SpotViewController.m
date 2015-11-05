//
//  SpotViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/21.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "SpotViewController.h"
#import "XSportLight.h"
@interface SpotViewController ()<XSportLightDelegate>

@end

@implementation SpotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"聚光灯";
}



-(void)viewDidAppear:(BOOL)animated{
    
    
    XSportLight *SportLight = [[XSportLight alloc]init];
    SportLight.messageArray = @[
                                @"这是《简书》",
                                @"点这里撰写文章",
                                @"搜索文章",
                                @"这会是StrongX的下一节课内容"
                                ];
    SportLight.rectArray = @[
                             [NSValue valueWithCGRect:CGRectMake(0,0,0,0)],
                             [NSValue valueWithCGRect:CGRectMake(ScreenWidth/2, ScreenHeight - 20, 50, 50)],
                             [NSValue valueWithCGRect:CGRectMake(ScreenWidth - 20, 42, 50, 50)],
                             [NSValue valueWithCGRect:CGRectMake(0,0,0,0)]
                             ];
    
    SportLight.delegate = self;
    [self presentViewController:SportLight animated:false completion:^{
        
    }];
}


-(void)XSportLightClicked:(NSInteger)index{
    NSLog(@"%ld",(long)index);
    
}

@end
