//
//  UIAlertView+STKit.h
//  GraceBuy(优美团购)
//
//  Created by ST on 15/6/26.
//  Copyright (c) 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (STKit)
+ (UIAlertView *)showWithTitle:(NSString *)title
                           msg:(NSString *)msg
                      delegate:(id /*<UIAlertViewDelegate>*/)delegate;
@end
