//
//  UIButton+STKit.h
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/26.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  给UIButton类添加许多有用的方法
 */
@interface UIButton (STKit)

/**
 *  给定框架 创建一个UIButton对象
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame;

/**
 *  给定框架和字符串(字符串字体颜色默认是白色)创建一个UIButton对象
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title;

/**
 *  给定框架、字符串和背景图片 创建一个UIButton对象
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
              backgroundImage:(UIImage *)backgroundImage;

/**
 *  给定框架、字符串、背景图片和高亮背景图片 创建一个UIButton对象
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
              backgroundImage:(UIImage *)backgroundImage
   highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;

/**
 *  给定框架和图片 创建一个UIButton对象
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)image;

/**
 *  给定框架、背景图片和高亮背景图片 创建一个UIButton对象
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage;

/**
 *  创建一个UIButton对象
 *
 *  @param frame      框架
 *  @param title      标题
 *  @param titleSize  标题尺寸
 *  @param titleColor 标题颜色
 *  @param imageName  背景图名称
 *
 *  @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                    titleSize:(CGFloat)titleSize
                   titleColor:(UIColor *)titleColor
          backgroundImageName:(NSString *)imageName;


/* 给定框架、背景图片和字体 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                selectedTitle:(NSString *)selectedTitle
                    titleSize:(CGFloat)titleSize
                   titleColor:(UIColor *)titleColor;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                    titleSize:(CGFloat)titleSize
                   titleColor:(UIColor *)titleColor
                      BGColor:(UIColor *)BGColor
              selectedBGColor:(UIColor *)selectedBGColor
          backgroundImageName:(NSString *)imageName;
@end
