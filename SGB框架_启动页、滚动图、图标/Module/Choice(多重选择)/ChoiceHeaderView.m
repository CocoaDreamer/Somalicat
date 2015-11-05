//
//  ChoiceHeaderView.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/29.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "ChoiceHeaderView.h"

@implementation ChoiceHeaderView

- (void)awakeFromNib
{
    self.tap_head = [[UITapGestureRecognizer alloc]init];
    [self addGestureRecognizer:self.tap_head];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, -2, ScreenWidth, 0.3)];
        lab.backgroundColor = [UIColor blackColor];
        lab.alpha = 0.2;
        [self addSubview:lab];
    }
    return self;
}

@end
