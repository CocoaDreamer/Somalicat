//
//  UITextField+STKit.h
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/27.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  给UITextField类添加许多有用的方法
 */
@interface UITextField (STKit)

/**
 *  UITextField初始化
 */
+ (UITextField *)textFieldWithFrame:(CGRect)frame                // 结构
                        placeholder:(NSString *)placeholder      // 提示信息
                              color:(UIColor *)color             // 颜色
                               font:(CGFloat)fontSize            // 字体大小
                         returnType:(UIReturnKeyType)returnType  // 回车键行为
                       keyboardType:(UIKeyboardType)keyboardType // 键盘类型
                             secure:(BOOL)secure                 // 密码
                        borderStyle:(UITextBorderStyle)borderStyle               // 边框样式
                 autoCapitalization:(UITextAutocapitalizationType)capitalization // 自动大写
                 keyboardAppearance:(UIKeyboardAppearance)keyboardAppearence     // 键盘外观样式
      enablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically          // 开启return键
                    clearButtonMode:(UITextFieldViewMode)clearButtonMode         // 清除按钮类型
                 autoCorrectionType:(UITextAutocorrectionType)autoCorrectionType // 自动更正风格
                           delegate:(id<UITextFieldDelegate>)delegate;           // 委托
@end
