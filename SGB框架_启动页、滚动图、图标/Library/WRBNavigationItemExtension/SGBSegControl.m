//
//  SGBSegControl.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/7.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "SGBSegControl.h"

@implementation SGBSegControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
        
        
    }
    return self;
}
-(void)segClick:(SGBSegControl *)segControl
{
    //作用: 原来被点击执行target-action对应的方法
    //现在: 判断action是否已经设置block, 如果被设置, 执行block
    if(self.action)
    {
//        NSString *seg_index = [NSString stringWithFormat:@"%ld",segControl.selectedSegmentIndex];
        self.action(segControl);
    }
    
}
@end
