//
//  MyInformationView.m
//  代理测试Test
//
//  Created by SGB on 15/9/22.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "MyInformationView.h"

@implementation MyInformationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define BTN_WIDTH 100
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.backgroundColor = [UIColor cyanColor];
        btn.frame = CGRectMake((SCREEN_WIDTH-BTN_WIDTH)/2, BTN_WIDTH, BTN_WIDTH,BTN_WIDTH);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"按钮测试" forState:UIControlStateNormal];
        btn.tag  = 200;
        [self addSubview:btn];
    }
    
    return self;
}

- (void)btnClick:(UIButton *)btn
{

    if ([self.myDelegate respondsToSelector:@selector(returnValueToShow:)]) {
        [self.myDelegate returnValueToShow:btn.tag];
    }
}

@end
