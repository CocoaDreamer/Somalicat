//
//  UIImageView+Tap.h
//  IBeiGuo
//
//  Created by ctrl on 15/2/2.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Tap)
- (void)imageViewTapWithtarget:(id)target
                           act:(SEL)act
;

/**
 * UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2)];
 self.imageView_AskExpert.userInteractionEnabled = YES;
 [self.imageView_AskExpert addGestureRecognizer:tap2];
 */
@end
