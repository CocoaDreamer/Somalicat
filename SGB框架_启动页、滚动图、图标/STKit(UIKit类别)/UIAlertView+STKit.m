//
//  UIAlertView+STKit.m
//  GraceBuy(优美团购)
//
//  Created by ST on 15/6/26.
//  Copyright (c) 2015年 ST. All rights reserved.
//

#import "UIAlertView+STKit.h"

@implementation UIAlertView (STKit)
+ (UIAlertView *)showWithTitle:(NSString *)title
                           msg:(NSString *)msg
                      delegate:(id /*<UIAlertViewDelegate>*/)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    alert.delegate = delegate;
    [alert show];
    return alert;
}
@end
