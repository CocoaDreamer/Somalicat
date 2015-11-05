//
//  WebViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/21.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "WebViewController.h"

#import "WebViewJavascriptBridge.h"
#import "ShowMessage.h"


@interface WebViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) WebViewJavascriptBridge *bridege;
- (IBAction)btnClickBack:(UIButton *)sender;//返回
- (IBAction)btnClickClose:(UIButton *)sender;//关闭


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //0 网页请求
    self.title = @"百度网页测试";
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:request];
    
    //1 添加代理
    self.webView.delegate = self;
#if 0
    //2 绑定bridge
    if (_bridege) {
        return;
    }
    [WebViewJavascriptBridge enableLogging];
    _bridege = [WebViewJavascriptBridge bridgeForWebView:self.webView webViewDelegate:self handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC received message from JS: %@", data);
        responseCallback(@"Response for message from ObjC");
    }];
    
    //3 js调oc方法 （可以通过data给oc方法传值，使用responseCallback将值再返回给js）
    [_bridege registerHandler:@"testObjcCallback" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"testObjcCallback called: %@", data);
        responseCallback(@"Response from testObjcCallback");
    }];
    
    //4 oc调js方法（通过data可以传值，通过 response可以接受js那边的返回值 ）
    id data = @{ @"greetingFromObjC": @"Hi there, JS!" };
    [_bridege callHandler:@"testJavascriptHandler" data:data responseCallback:^(id responseData) {
        NSLog(@"testJavascriptHandler responded: %@", responseData);
    }];
    
    //5 oc给js传值（通过 response接受返回值 ）
    [_bridege send:@"A string sent from ObjC to JS" responseCallback:^(id responseData) {
        NSLog(@"sendMessage got response: %@", responseData);
    }];
    
    //6 oc给js传值（无返回值）
    [_bridege send:@"A string sent from ObjC after Webview has loaded."];
    
    
#endif
    //7 网页样式
    self.webView.allowsInlineMediaPlayback = YES;
    [self.webView sizeToFit];
    
    
    
}

#pragma mark - 代理_webView
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [ShowMessage showLoadingData:self.view];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    NSInteger height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"] intValue];
    NSLog(@"%@----高度：%ld",NSStringFromSelector(_cmd),height);
}
#pragma mark - 事件_返回
- (IBAction)btnClickBack:(UIButton *)sender {
    [self.webView goBack];
}

- (IBAction)btnClickClose:(UIButton *)sender {
    //有push的时候
    [self.navigationController popViewControllerAnimated:YES];
}
@end
