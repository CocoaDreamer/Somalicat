//
//  UILabel+STKit.h
//  BeautyBuy
//
//  Created by SGB on 15/6/15.
//  Copyright (c) 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (STKit)
/**
 *  初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color;            // 颜色

/**
 *  初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment;  // 对齐方式

/**
 *  初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
                      lines:(NSInteger)lines;            // 行数

/**
 *  初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
                      lines:(NSInteger)lines             // 行数
                shadowColor:(UIColor *)colorShadow;      // 阴影颜色
/**
 *  给文本视图添加点击事件
 *
 *  @param target   目标
 *  @param action   事件
 */
- (void)addTarget:(id)target
           action:(SEL)action;
@end
