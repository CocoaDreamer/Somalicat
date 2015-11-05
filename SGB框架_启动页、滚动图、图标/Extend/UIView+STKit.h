//
//  UIView+STKit.h
//  GraceBuy(优美团购)
//
//  Created by ST on 15/6/20.
//  Copyright (c) 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (STKit)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  UIView 的点击事件
 *
 *  @param target   目标
 *  @param action   事件
 */

- (void)addTarget:(id)target
           action:(SEL)action;

/**
 *  UIView初始化
 */
+ (UIView *)viewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor;

/**
 *  创建边框
 */
- (void)createBordersWithColor:(UIColor *)color
               andCornerRadius:(CGFloat)radius
                      andWidth:(CGFloat)width;

/**
 *  删除边框
 */
- (void)removeBorders;

/**
 *  创建阴影
 */
- (void)createRectShadowWithOffset:(CGSize)offset
                           opacity:(CGFloat)opacity
                            radius:(CGFloat)radius;

/**
 *  创建圆角半径阴影
 */
- (void)createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                          offset:(CGSize)offset
                                         opacity:(CGFloat)opacity
                                          radius:(CGFloat)radius;

/**
 *  删除阴影
 */
- (void)removeShadow;

/**
 *  设置圆角半径
 */
- (void)setCornerRadius:(CGFloat)radius;


@end
