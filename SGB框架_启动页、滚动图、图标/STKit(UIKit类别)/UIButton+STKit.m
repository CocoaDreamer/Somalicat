//
//  UIButton+STKit.m
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/26.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import "UIButton+STKit.h"

@implementation UIButton (STKit)

/* 给定框架创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
{
    return [UIButton buttonWithFrame:frame
                               title:nil];
}

/* 给定框架和字符串(字符串字体颜色默认是白色) 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
{
    return [UIButton buttonWithFrame:frame
                               title:title
                     backgroundImage:nil];
}

/* 给定框架、字符串和背景图片创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
              backgroundImage:(UIImage *)backgroundImage
{
    return [UIButton buttonWithFrame:frame
                               title:title
                     backgroundImage:backgroundImage
          highlightedBackgroundImage:nil];
}

/* 给定框架、字符串、背景图片和高亮背景图片 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
              backgroundImage:(UIImage *)backgroundImage
   highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title
            forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage
                      forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage
                      forState:UIControlStateHighlighted];
    return button;
}

/* 给定框架和图片 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)image
{
    return [UIButton buttonWithFrame:frame
                               image:image
                    highlightedImage:nil];
}

/* 给定框架、背景图片和高亮背景图片 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:image
            forState:UIControlStateNormal];
    [button setImage:highlightedImage
            forState:UIControlStateHighlighted];
    return button;
}

/* 给定框架、背景图片和字体 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                    titleSize:(CGFloat)titleSize
                   titleColor:(UIColor *)titleColor
          backgroundImageName:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    NSDictionary *dic_attr = @{NSFontAttributeName:[UIFont systemFontOfSize:titleSize],
                               NSForegroundColorAttributeName:titleColor};
    NSAttributedString *str_login = [[NSAttributedString alloc]initWithString:title
                                                                   attributes:dic_attr];
    [button setAttributedTitle:str_login
                      forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:imageName]
                      forState:UIControlStateNormal];
    return button;
}

/* 给定框架、背景图片和字体 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                selectedTitle:(NSString *)selectedTitle
                    titleSize:(CGFloat)titleSize
                   titleColor:(UIColor *)titleColor
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    NSDictionary *dic_attr = @{NSFontAttributeName:[UIFont systemFontOfSize:titleSize],
                               NSForegroundColorAttributeName:titleColor};
    NSAttributedString *str_login = [[NSAttributedString alloc]initWithString:title
                                                                   attributes:dic_attr];
    NSAttributedString *str_loginSelected = [[NSAttributedString alloc]initWithString:selectedTitle
                                                                   attributes:dic_attr];

    
    [button setAttributedTitle:str_login
                      forState:UIControlStateNormal];
    [button setAttributedTitle:str_loginSelected
                      forState:UIControlStateSelected];
    
    return button;
}



/* 给定框架、背景图片和字体 创建一个UIButton对象 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                    titleSize:(CGFloat)titleSize
                   titleColor:(UIColor *)titleColor
                      BGColor:(UIColor *)BGColor
              selectedBGColor:(UIColor *)selectedBGColor
          backgroundImageName:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    NSDictionary *dic_attr = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:titleSize],
                               NSForegroundColorAttributeName:titleColor};
    NSAttributedString *str_login = [[NSAttributedString alloc]initWithString:title
                                                                   attributes:dic_attr];
    [button setAttributedTitle:str_login
                      forState:UIControlStateNormal];
    
    [button setBackgroundColor:BGColor];
    if (button.selected) {
        [button setBackgroundColor:selectedBGColor];
    }
    
    [button setBackgroundImage:[UIImage imageNamed:imageName]
                      forState:UIControlStateNormal];
    return button;
}
@end
