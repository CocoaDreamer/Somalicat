//
//  UIImageView+STKit.m
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/26.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import "UIImageView+STKit.h"

@implementation UIImageView (STKit)

/**
 * 给定图片名称、中心点初始化UIImageView
 */
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                                 center:(CGPoint)center
{
    UIImageView *_image = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:imageName];
    [_image setImage:image];
    [_image setSize:image.size];
    [_image setCenter:center];
    return _image;
}

/* 给定图片名称、框架初始化UIImageView */
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                                  frame:(CGRect)rect
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:rect];
    [_image setImage:[UIImage imageNamed:imageName]];
    return _image;
}


/* 给定图片、框架初始化UIImageView */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
                              frame:(CGRect)rect
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:rect];
    [_image setImage:image];
    return _image;
}

/* 给定图片、尺寸、中心点初始化UIImageView */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
                               size:(CGSize)size
                             center:(CGPoint)center
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:CGRectMake(0, 0, size.width, size.height)];
    [_image setImage:image];
    [_image setCenter:center];
    return _image;
}

/* 给图片视图添加点击事件 */
- (void)addTarget:(id)target
           action:(SEL)action;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}
@end
