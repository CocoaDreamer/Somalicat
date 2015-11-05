//
//  Utility.m
//  ErpApp2.0
//
//  Created by EricWei on 14-3-17.
//
//

#import "Utility.h"
#import "AppDelegate.h"
#import <CommonCrypto/CommonDigest.h>
@implementation Utility
//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"]) {
        return YES;
    }
    
    return NO;
}

+(NSString *)GetStrByNull:(NSString *)str returnStr:(NSString *)returnStr
{
    if ([self isBlankString:str])
        return returnStr;
    return str;
}
//去除空格
+(NSString *)getString:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    
}


//处理空字符串
+(NSString *)doEmptyString:(NSString*)str
{
    
    if ([self isBlankString:str] || [str isEqualToString:@"(null)"]) {
        return @"";
    }
    return str;
}



#pragma  mark - 设置返回按钮
+(NSString*)DateFromater:(NSDate*)current strDateFromater:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:str];
    //用[NSDate date]可以获取系统当前时间
    return  [dateFormatter stringFromDate:current];
    
}

//设置返回按钮
//+(void)setBackButton:(UIViewController*)uiviewcontroller navigationItem:(UINavigationItem *)navigationItem selector:(SEL)selector
//{
//    UIBarButtonItem *back = [PBFlatBarButtonItems backBarButtonItemWithTarget:uiviewcontroller selector:selector];
//    //OKBarButtonItemWithTarget
//    //    UIBarButtonItem *back = [PBFlatBarButtonItems OKBarButtonItemWithTarget:uiviewcontroller imagename:[UIImage imageNamed:@"back"] selector:selector];
//    [navigationItem setLeftBarButtonItem:back];
//}

+(BOOL)isReachable:(UIView*)targetView
{
    //如果网络不可用，则取消所有正在执行的请求
    if (![ApplicationDelegate.apiEngine isReachable])
    {
        [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
        [ShowMessage showTextOnly:@"当前网络不可用，请检查网络设置" messageView:targetView];
        [ApplicationDelegate.apiEngine cancelAllOperations];
        return NO;
    }
    return YES;
}

+ (NSString *) md5:(NSString*)str
{
    str=[NSString stringWithFormat:@"ct%@cl",str];
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [[NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ] uppercaseString];
}
+ (UIColor *)UIColorFromRGB: (NSInteger)rgbValue {
    
    UIColor *rgbColor;
    
    rgbColor = [UIColor colorWithRed: ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0
                               green: ((float)((rgbValue & 0xFF00) >> 8)) / 255.0
                                blue: ((float)(rgbValue & 0xFF)) / 255.0
                               alpha: 1.0];
    
    return rgbColor;
}
+(BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
/**
 @abstract  返回字符串的高度。
 @discussion <#statements#>
 @since <#statements#>
 */
+ (CGSize)boundingRectWithSize:(CGSize)size strText:(NSString*)strText font:(UIFont*)font
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [strText boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}


@end
