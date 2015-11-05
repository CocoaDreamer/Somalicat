//
//  NSString+STFoundation.h
//  GraceBuy(优美团购)
//
//  Created by ST on 15/6/20.
//  Copyright (c) 2015年 ST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (STFoundation)
/**
 *  返回字符串所占用的尺寸
 *
 *  @param fontSize     字体大小
 *  @param maxWidth     最大宽度
 *  @param maxHeight    最大高度
 
 */
- (CGSize)sizeWithFont:(CGFloat)fontSize
              maxWidth:(CGFloat)maxWidth
             maxHeight:(CGFloat)maxHeight;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
