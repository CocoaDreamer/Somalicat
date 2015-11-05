//
//  APIViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/23.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "APIViewController.h"

@interface APIViewController ()
@property (strong, nonatomic) IBOutlet UITextView *testView_test;
- (IBAction)btnClickAPI:(UIButton *)sender;

@end

@implementation APIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testView_test.backgroundColor = [UIColor cyanColor];
    self.testView_test.textAlignment = NSTextAlignmentCenter;
    self.testView_test.text = nil;
    
}



- (IBAction)btnClickAPI:(UIButton *)sender {
    [self APITest];
}
/**
 * 准用测试接口
 */
- (void)APITest
{
    [[ApiHelper sharedApiHelper]requestParamTest:nil api_baseUrl:API_TestDb targetView:self.view completionHandler:^(id jsonObject) {
        NSLog(@"************");
        NSLog(@"****准用测试接口:%@",jsonObject);
        NSLog(@"************");
        
        self.testView_test.text = jsonObject[@"comments"][0][@"body"];
    } errorHandler:^{
        
    }];
}


/**
 * 
 
 
 
 
 
 URL:
 
 http://tips.producter.io/san-bu-shi-yong-json-server-mo-ni-api/?plg_nld=1&plg_auth=1&plg_nld=1&plg_dev=1&plg_uin=1&plg_usr=1&plg_vkey=1&plg_nld=1&plg_uin=1&plg_nld=1&plg_auth=1&plg_usr=1&plg_vkey=1&plg_dev=1
 
 
 
 
 Menu
 三步使用 JSON Server 模拟 API
 22 September 2015 on iOS, api
 有了设计图之后，后端的 API 往往也才刚刚开始做，在这个时候，能有一个原型工具模拟一份 API 会让一切过的开心很多。
 
 
 安装
 第一步当然是安装啦
 Homebrew
 Homebrew 是 Mac 上的第三方库管理工具，我们使用 Homebrew 来安装 Node.js
 一、
 ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 
 二、
 Node.js  
 
 brew install node
 
 
 
 三、
 json-server
 
 npm install -g json-server
 
 
 四、
 
 创建 db.json
 找个你喜欢的目录，创建 db.json，里面包含你需要的数据模型
 {
 "posts": [
 { "id": 1, "title": "json-server", "author": "typicode" }
 ],
 "comments": [
 { "id": 1, "body": "some comment", "postId": 1 }
 ],
 "profile": { "name": "typicode" }
 }
 
 五、
 
 随后，利用 json-server --watch db.json 来启动 Server
 测试
 启动起来之后，json-server 会根据你的 db.json 自动建立 RESTful API，以上面的 db.json 的 post 为例
 GET    /posts
 GET    /posts/1
 POST   /posts
 PUT    /posts/1
 PATCH  /posts/1
 DELETE /posts/1
 更深入的使用方式，可以参考 json-server 的官方文档。
 
 Kevin
 Read more posts by this author.
 */
@end
