//
//  ConstraintViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/7.
//  Copyright (c) 2015年 SGB. All rights reserved. //

#import "ConstraintViewController.h"


#define STR1 @"abcd"
#define STR2 @"gggg"
#define STR_BIANLIANG t
#define STR [NSString stringWithFormat:@"%@%@%@",STR1,STR2,STR_BIANLIANG]
@interface ConstraintViewController ()

@end

@implementation ConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"************");
    NSLog(@"****%@",NSStringFromCGRect(self.view_constaint.frame));
    NSLog(@"************");
    
    
    DLog(@"****%@",NSStringFromCGRect(self.view_constaint.frame));
}



@end
