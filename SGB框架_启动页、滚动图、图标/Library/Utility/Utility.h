//
//  Utility.h
//  ErpApp2.0
//
//  Created by EricWei on 14-3-17.
//
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
#pragma  mark - 判断字符串是否为空
//判断字符串是否为空
+(BOOL) isBlankString:(NSString *)string;

#pragma  mark - 去除空格
//去除空格
+(NSString*)getString:(NSString *)string;

#pragma  mark - 隐藏uitableview多余的cell
//隐藏uitableview多余的cell
+(void)setExtraCellLineHidden: (UITableView *)tableView;

#pragma  mark - 处理空字符串
//处理空字符串
+(NSString *)doEmptyString:(NSString*)str;

#pragma  mark - 日期格式化
//日期格式化
+(NSString*)DateFromater:(NSDate*)current strDateFromater:(NSString *)str;

#pragma  mark - 设置返回按钮
////设置返回按钮
//+(void)setBackButton:(UIViewController*)uiviewcontroller navigationItem:(UINavigationItem *)navigationItem selector:(SEL)selector;

+(NSString*)GetStrByNull:(NSString*)str returnStr:(NSString*)returnStr;
+(BOOL)isReachable:(UIView*)targetView;

#pragma mark - Md5加密

+(NSString *)md5:(NSString*)str;
+ (UIColor *)UIColorFromRGB: (NSInteger)rgbValue;
+ (BOOL)isPureInt:(NSString *)string;
/**
 @abstract  返回字符串的高度。
 @discussion <#statements#>
 @since <#statements#>
 */
+(CGSize)boundingRectWithSize:(CGSize)size strText:(NSString*)strText font:(UIFont*)font;
@end
