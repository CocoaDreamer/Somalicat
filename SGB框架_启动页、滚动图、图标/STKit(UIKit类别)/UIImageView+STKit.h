//
//  UIImageView+STKit.h
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/26.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  给UIImageView类添加许多有用的方法
 */
@interface UIImageView (BFKit)

/**
 * 给定图片名称、中心点初始化UIImageView
 */
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                                 center:(CGPoint)center;

/**
 *  给定图片名称、框架初始化UIImageView 
 */
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                  frame:(CGRect)rect;

/**
 *  给定图片、框架初始化UIImageView
 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
                              frame:(CGRect)rect;

/**
 *  给定图片、尺寸、中心点初始化UIImageView
 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
                               size:(CGSize)size
                             center:(CGPoint)center;


/**
 *  UIImageView 的点击事件
 *
 *  @param target   目标
 *  @param action   事件
 */

- (void)addTarget:(id)target
           action:(SEL)action;
@end
