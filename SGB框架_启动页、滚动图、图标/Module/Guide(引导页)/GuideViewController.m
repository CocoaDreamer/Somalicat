//
//  GuideViewController.m
//  IBeiGuo
//
//  Created by ctrl on 15/1/30.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import "GuideViewController.h"
#import "IndexViewController.h"
#import "IndexTabBarController.h"

@interface GuideViewController ()
{
    NSInteger _accountToMain;
}
@property (strong,nonatomic) UIButton *gotoMainViewButton;


@end

@implementation GuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _accountToMain=0;
    //00代理
    self.guideScrollView.delegate = self;
    
    
    //0 图片的Frame
    CGFloat imageW = CGRectGetWidth([ UIScreen mainScreen ].bounds);
    CGFloat imageH = CGRectGetHeight([ UIScreen mainScreen ].bounds);
   
    
    //0适配图片
    //0.1  定义数组
    NSArray *array_pic ;
    
    //0.2 判断尺寸
//    if (320 == imageW && 480 == imageH) {       //4 4s   320*480
//        array_pic = @[@"w01",@"w02",@"w03",@"w04"];
//    }else if (320 == imageW && 568 == imageH){  //5S 5   320* 568
//        array_pic = @[@"guide_5_1",@"guide_5_2"];
//    }else if (375 == imageW && 667 == imageH){  //6  375 * 667
//        array_pic = @[@"guide_6_1",@"guide_6_2"];
//    }else if (375 == imageW && 667 == imageH){  //6plus   414 *  736
//        array_pic = @[@"guide_6p_1",@"guide_6p_2"];
//    }else{                                      //其他  万一iPad啥的
//        array_pic = @[@"guide_6p_1",@"guide_6p_2"];
//    }
    array_pic = @[@"w01",@"w02",@"w03",@"w04"];
    
    CGFloat imageY = 0;
    self.guidePageControl.numberOfPages = array_pic.count;
    NSInteger totalCount = self.guidePageControl.numberOfPages;
    self.guideScrollView.showsHorizontalScrollIndicator = NO;
    
    
    
   
    //1.添加4张图片
    for (int i = 0; i < totalCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i *imageW, imageY, imageW, imageH);
        //        设置图片
        NSString *name = array_pic[i];
        imageView.image = [UIImage imageNamed:name];
        [self.guideScrollView addSubview:imageView];
    }
    
    //2.设置scrollview的滚动范围
    self.guideScrollView.contentSize = CGSizeMake(totalCount *imageW, 0);
    self.guideScrollView.pagingEnabled = YES;
    
    //3.添加进入主程序的按钮
    self.gotoMainViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat x_GotoMainButton=imageW*(self.guidePageControl.numberOfPages-1)+(imageW-80)/2;
    [self.gotoMainViewButton setFrame:CGRectMake(x_GotoMainButton, imageH-100, 80, 40)];
    [self.gotoMainViewButton setTitle:@"立即体验" forState:UIControlStateNormal];
    [self.gotoMainViewButton setBackgroundColor:[UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:0.3]];
    self.gotoMainViewButton.layer.cornerRadius = 10.0;
    [self.gotoMainViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.guideScrollView addSubview:self.gotoMainViewButton];
    
    //4.进入主程序
    [self.gotoMainViewButton addTarget:self action:@selector(gotoMainView) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)nextImage
{
    int page = (int)self.guidePageControl.currentPage;
    page++;
    //  滚动scrollview
    CGFloat x = page * self.guideScrollView.frame.size.width;
    self.guideScrollView.contentOffset = CGPointMake(x, 0);
}



// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    计算页码
    //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    self.guidePageControl.currentPage = page;
    if(scrollView.contentOffset.x > scrollviewW*(self.guidePageControl.numberOfPages-1))
    {
//        _accountToMain++;
        
          //进入主程序
       [self gotoMainView];
    }
}



#pragma mark - gotoMainView
-(void)gotoMainView
{
    
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    IndexTabBarController *ctrl_index = (IndexTabBarController*)[storyboard instantiateViewControllerWithIdentifier:@"IndexTabBarController"];
//    UINavigationController *navctrl_index = [[UINavigationController alloc]initWithRootViewController:ctrl_index];
    ApplicationDelegate.window.rootViewController = ctrl_index;

}


@end
