//
//  IndexViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/1.
//  Copyright (c) 2015年 SGB. All rights reserved.
//
#define KEY (NSString *)kCFBundleVersionKey
#define ScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

#import "IndexViewController.h"
#import "HeadView.h"


#import "PicScrollCell.h"
#import "CategoryCell.h"
#import "ThirdCell.h"


@interface IndexViewController ()<CategoryCellDelegate>
@property (strong, nonatomic) UIView *view_ad;
@property (strong, nonatomic) UIImageView *imageView_ad;
@property (strong, nonatomic) UIButton *button_jump;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self setNavigationBarBackgroundImage:@"tabbar_radio_selected"];
    
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView_index.showsVerticalScrollIndicator = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    //0 加载广告
    if (ApplicationDelegate.isFirstLaunch) {
    }else{
        [self showViewAd];
    }
}
//弹出广告页
-(void)showViewAd
{


    //0 添加imageView
    self.imageView_ad=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,ScreenWidth,ScreenHeight)];
    [self.imageView_ad setBackgroundColor:[UIColor whiteColor]];
    self.imageView_ad.userInteractionEnabled=YES;
    
    //1 添加跳过按钮
    self.button_jump= [UIButton buttonWithType:UIButtonTypeCustom];
    [ self.button_jump setFrame:CGRectMake(ScreenWidth-70, 30, 50, 30)];
    [ self.button_jump setTitle:@"跳过" forState:UIControlStateNormal];
    [ self.button_jump setBackgroundColor:[UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:0.1]];
    self.button_jump.layer.cornerRadius = 10.0;
    [ self.button_jump setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
   
    //3 视图的添加
    [self.imageView_ad addSubview:self.button_jump];
    [self.imageView_ad bringSubviewToFront: self.button_jump];
    [ApplicationDelegate.window addSubview:self.imageView_ad];
    [ApplicationDelegate.window bringSubviewToFront:self.imageView_ad];
    
    
    //4 事件1_点击广告
    [self.imageView_ad addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAd)]];
    
    
    //5 事件2_跳过广告
    [ self.button_jump addTarget:self action:@selector(button_jump:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //6 加载广告

    [self loadAD];
    
}

- (void)tapAd
{
    self.imageView_ad.userInteractionEnabled = NO;
    [self performSegueWithIdentifier:@"SegueAD" sender:self];

}


- (void)button_jump:(UIButton *)btn
{
    self.imageView_ad.userInteractionEnabled = NO;
    self.imageView_ad.hidden=YES;
    self.button_jump.hidden=YES;
}

- (void)loadAD
{

    
    self.imageView_ad.image = [UIImage imageNamed:@"w01"];
    NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"start",@"ad_position", nil];
    [[ApiHelper sharedApiHelper] requestParamRemoveMsg:dic api_baseUrl:API_ShopIndexGetAd completionHandler:^(id jsonObject){
        
        NSString *url_ad = jsonObject[0][@"ad_img"];
        [self.imageView_ad sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url_ad]] placeholderImage:[UIImage imageNamed:@"w02"]];
        [self timedelay:2];
     } errorHandler:^{
        [self timedelay:0.1];
     }];

}




//启动广告 延时加载
-(void)timedelay:(double)time
{
    double delayInSeconds = time;
//    __block IndexViewController* bself = self;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.imageView_ad.hidden=YES;
        self.button_jump.hidden=YES;
        
    });
    
}




#pragma mark - 首页的UI设计
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section) {
       return PIC_SCROLL_HEIGHT;
    }else if (1 == indexPath.section) {
        return 146;
    }
    return 125;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PicScrollCell *cell = [PicScrollCell cellWithTableView:tableView];
        cell.view_pic_scroll.block = ^(NSDictionary *dic){
            NSDictionary *dic2 = [NSDictionary dictionaryWithDictionary:dic];
            NSLog(@"************");
            NSLog(@"****%@",dic2);
            NSLog(@"************");
        };
        return cell;
    }else if(indexPath.section == 1){
        CategoryCell *cell = [CategoryCell cellWithTableView:tableView];
        cell.delegate = self;
        return cell;
    }else{
        ThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThirdCell"];
        return cell;
    }
    
}


#pragma mark - 代理
- (void)cellWithCategoryType:(BMSortType)sortType
{
    NSLog(@"************");
    NSLog(@"****代理类型%ld",sortType);
    NSLog(@"************");
}



@end
