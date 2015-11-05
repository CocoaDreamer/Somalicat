//
//  UIImageView+Tap.m
//  IBeiGuo
//
//  Created by ctrl on 15/2/2.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import "UIImageView+Tap.h"

@implementation UIImageView (Tap)
- (void)imageViewTapWithtarget:(id)target act:(SEL)act
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:act];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}


@end
