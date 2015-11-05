//
//  UILabel+STKit.m
//  BeautyBuy
//
//  Created by SGB on 15/6/15.
//  Copyright (c) 2015年 ST. All rights reserved.
//

#import "UILabel+STKit.h"

@implementation UILabel (STKit)

/* 初始化UILael */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
{
    return [UILabel labelWithFrame:frame
                              text:text
                              size:size
                             color:color
                         alignment:NSTextAlignmentLeft
                             lines:1
                       shadowColor:[UIColor clearColor]];
}


/* 初始化UILael */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
{
    return [UILabel labelWithFrame:frame
                              text:text
                              size:size
                             color:color
                         alignment:alignment
                             lines:1
                       shadowColor:[UIColor clearColor]];
}

/* 初始化UILael */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
                      lines:(NSInteger)lines             // 行数
{
    return [UILabel labelWithFrame:frame
                              text:text
                              size:size
                             color:color
                         alignment:alignment
                             lines:lines
                       shadowColor:[UIColor clearColor]];
}

/* 初始化UILael */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
                      lines:(NSInteger)lines             // 行数
                shadowColor:(UIColor *)colorShadow;      // 阴影颜色
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:[UIFont systemFontOfSize:size]];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:color];
    [label setShadowColor:colorShadow];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:lines];
    
    return label;
}

/* 给文本视图添加点击事件 */
- (void)addTarget:(id)target
           action:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

@end
