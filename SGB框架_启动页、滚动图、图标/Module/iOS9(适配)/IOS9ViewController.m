//
//  IOS9ViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/23.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "IOS9ViewController.h"

@interface IOS9ViewController ()


@property (strong, nonatomic) UIBezierPath *path_1;

@property (strong, nonatomic) IBOutlet UITextView *textView_iOS9;
@end

@implementation IOS9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView_iOS9.backgroundColor = [UIColor cyanColor];
    self.textView_iOS9.text = @"1.指定所有HTTP连接都可正常请求<key>NSAppTransportSecurity</key><dict><key>NSAllowsArbitraryLoads</key><true/></dict>      2.   如果你的应用使用了如SSO授权登录或跳转分享功能，在iOS9下就需要增加一个可跳转的白名单，指定对应跳转App的URL Scheme，否则将在第三方平台判断是否跳转时用到的canOpenURL时返回NO，进而只进行webview授权或授权/分享失败。同样在info.plist增加： <key>LSApplicationQueriesSchemes</key>  <array><!-- 微信 URL Scheme 白名单--><string>wechat</string><string>weixin</string><!-- 新浪微博 URL Scheme 白名单--><string>sinaweibohd</string><string>sinaweibo</string> <string>sinaweibosso</string><string>weibosdk</string><string>weibosdk2.5</string><!-- QQ、Qzone URL Scheme 白名单--><string>mqqapi</string><string>mqq</string><string>mqqOpensdkSSoLogin</string><string>mqqconnect</string><string>mqqopensdkdataline</string><string>mqqopensdkgrouptribeshare</string><string>mqqopensdkfriend</string><string>mqqopensdkapi</string><string>mqqopensdkapiV2</string><string>mqqopensdkapiV3</string><string>mqzoneopensdk</string><string>wtloginmqq</string><string>wtloginmqq2</string><string>mqqwpa</string><string>mqzone</string><string>mqzonev2</string><string>mqzoneshare</string><string>wtloginqzone</string><string>mqzonewx</string><string>mqzoneopensdkapiV2</string><string>mqzoneopensdkapi19</string><string>mqzoneopensdkapi</string><string>mqzoneopensdk</string><!-- 人人 URL Scheme 白名单--><string>renrenios</string><string>renrenapi</string><string>renren</string><string>renreniphone</string><!-- 易信 URL Scheme 白名单--><string>yixin</string><!-- instagram URL Scheme 白名单--><string>instagram</string><!-- whatsapp URL Scheme 白名单--><string>whatsapp</string><!-- line URL Scheme 白名单--><string>line</string></array>    3.  应用瘦身(App thining)iOS9 SDK新增了对App瘦身的功能，详情见App thining。目前各个第三方平台正在进行App thining的支持，所以为了正常使用第三方SDK及分享SDK，需要在Build Setting中将**Enable bitcode**关闭,或设置编译标识ENABLE_BITCODE=NO。注：bitcode仅在Xcode7以上显示并默认开启。https://github.com/ChenYilong/iOS9AdaptationTips#xcode";
}

//    UIBezierPath *tempPath = [[UIBezierPath alloc] init];
//    [tempPath moveToPoint:CGPointMake(0, 0)];
//    [tempPath addLineToPoint:CGPointMake(0, 0)];
//    [tempPath addLineToPoint:CGPointMake(300, 0)];
//    [tempPath addLineToPoint:CGPointMake(300, 300)];
//    [tempPath addLineToPoint:CGPointMake(0, 300)];
//    [tempPath closePath];
//    [tempPath fill];
//    self.path_1 = tempPath;
// 
//  
//}
//
//- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//    if ([self.path_1  containsPoint:point]) {
//        NSLog(@"####在");
//    }else{
//        NSLog(@"####不在");
//    }
//}
//
/**
 *
 
 
 
 在新发布的iOS9系统上围绕用户数据的安全性和体验新增了一些安全特性，同时也影响了应用的实现以及集成方式，为了保证良好的稳定性和体验，需要做如下处理：
 1.  HTTP传输安全
 以iOS9 SDK编译的工程会默认以SSL安全协议进行网络传输，即HTTPS，如果依然使用HTTP协议请求网络会报系统异常并中断请求。目前可用如下两种方式保持用HTTP进行网络连接：
 A、在info.plist中加入安全域名白名单(右键info.plist用source code打开)
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSExceptionDomains</key>
 <dict>
 <key>log.umsns.com</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
 <true/>
 <key>NSTemporaryExceptionMinimumTLSVersion</key>
 <string>TLSv1.1</string>
 </dict>
 <key>sns.whalecloud.com</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
 <true/>
 <key>NSTemporaryExceptionMinimumTLSVersion</key>
 <string>TLSv1.1</string>
 </dict>
 
 <!-- 集成新浪微博对应的HTTP白名单-->
 <key>sina.cn</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
 <false/>
 </dict>
 <key>sina.com.cn</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
 <false/>
 </dict>
 <key>weibo.cn</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
 <false/>
 </dict>
 <key>weibo.com</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
 <true/>
 <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
 <false/>
 </dict>
 <!-- 新浪微博-->
 
 <!-- 集成微信、QQ、Qzone、腾讯微博授权对应的HTTP白名单-->
 <key>qq.com</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
 <true/>
 <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
 <false/>
 </dict>
 <!-- 腾讯授权-->
 
 <!-- 集成人人授权对应的HTTP白名单-->
 <key>renren.com</key>
 <dict>
 <key>NSIncludesSubdomains</key>
 <true/>
 <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
 <true/>
 <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
 <false/>
 </dict>
 <!-- 人人授权-->
 
 </dict>
 </dict>
 
 注：以上部分平台官方未给出相应白名单，由技术人员测试各个平台所收集而来，如果有所遗漏，请自行加入并向客服说明，我们会进一步补充名单。
 B、在info.plist的NSAppTransportSecurity下新增NSAllowsArbitraryLoads并设置为YES，指定所有HTTP连接都可正常请求
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSAllowsArbitraryLoads</key>
 <true/>
 </dict>
 
 2.  应用跳转（SSO等）
 如果你的应用使用了如SSO授权登录或跳转分享功能，在iOS9下就需要增加一个可跳转的白名单，指定对应跳转App的URL Scheme，否则将在第三方平台判断是否跳转时用到的canOpenURL时返回NO，进而只进行webview授权或授权/分享失败。
 同样在info.plist增加：
 <key>LSApplicationQueriesSchemes</key>
 <array>
 <!-- 微信 URL Scheme 白名单-->
 <string>wechat</string>
 <string>weixin</string>
 
 <!-- 新浪微博 URL Scheme 白名单-->
 <string>sinaweibohd</string>
 <string>sinaweibo</string>
 <string>sinaweibosso</string>
 <string>weibosdk</string>
 <string>weibosdk2.5</string>
 
 <!-- QQ、Qzone URL Scheme 白名单-->
 <string>mqqapi</string>
 <string>mqq</string>
 <string>mqqOpensdkSSoLogin</string>
 <string>mqqconnect</string>
 <string>mqqopensdkdataline</string>
 <string>mqqopensdkgrouptribeshare</string>
 <string>mqqopensdkfriend</string>
 <string>mqqopensdkapi</string>
 <string>mqqopensdkapiV2</string>
 <string>mqqopensdkapiV3</string>
 <string>mqzoneopensdk</string>
 <string>wtloginmqq</string>
 <string>wtloginmqq2</string>
 <string>mqqwpa</string>
 <string>mqzone</string>
 <string>mqzonev2</string>
 <string>mqzoneshare</string>
 <string>wtloginqzone</string>
 <string>mqzonewx</string>
 <string>mqzoneopensdkapiV2</string>
 <string>mqzoneopensdkapi19</string>
 <string>mqzoneopensdkapi</string>
 <string>mqzoneopensdk</string>
 
 <!-- 人人 URL Scheme 白名单-->
 <string>renrenios</string>
 <string>renrenapi</string>
 <string>renren</string>
 <string>renreniphone</string>
 
 <!-- 易信 URL Scheme 白名单-->
 <string>yixin</string>
 
 <!-- instagram URL Scheme 白名单-->
 <string>instagram</string>
 
 <!-- whatsapp URL Scheme 白名单-->
 <string>whatsapp</string>
 
 <!-- line URL Scheme 白名单-->
 <string>line</string>
 
 </array>
 
 注：以上部分平台官方未给出相应白名单，由技术人员测试各个平台所收集而来，如果有所遗漏，请自行加入并向客服说明，我们会进一步补充名单。
 
 
 3.  应用瘦身(App thining)
 iOS9 SDK新增了对App瘦身的功能，详情见App thining。目前各个第三方平台正在进行App thining的支持，所以为了正常使用第三方SDK及分享SDK，需要在Build Setting中将**Enable bitcode**关闭,或设置编译标识ENABLE_BITCODE=NO。
 注：bitcode仅在Xcode7以上显示并默认开启。

 */


@end
