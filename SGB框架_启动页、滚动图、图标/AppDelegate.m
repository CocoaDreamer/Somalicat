//
//  AppDelegate.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/1.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "IndexViewController.h"
#import "IndexTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   
    
    
    [[UINavigationBar appearance]setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
     self.apiEngine=[[MKNetworkEngine alloc]initWithHostName:API_HOSTNAME customHeaderFields:nil];
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:KEY];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[KEY];
    if ([lastVersion isEqualToString:currentVersion]) {//说明不是第一次运行该版本
        
        ApplicationDelegate.isFirstLaunch = NO;
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        IndexTabBarController *ctrl_index = (IndexTabBarController*)[storyboard instantiateViewControllerWithIdentifier:@"IndexTabBarController"];
//        UINavigationController *navctrl_index = [[UINavigationController alloc]initWithRootViewController:ctrl_index];
        self.window.rootViewController = ctrl_index;
        
        
    }else{
        
        ApplicationDelegate.isFirstLaunch = YES;
        GuideViewController *ctrl_guide = [[GuideViewController alloc] initWithNibName:@"GuideViewController" bundle:nil];
        self.window.rootViewController = ctrl_guide;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


//0 设置所有状态栏白色
/**
 * 
 //00    View controller-based status appearance  属性为NO
 //01    setStatusBarStyle
 [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
 */



//1 设置所有导航标题颜色为白色


/**
 * 
 [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
 */





//2 设置导航的颜色
/**
 * 
 
 [[UINavigationBar appearance]setBarTintColor:[UIColor redColor]];
 */


//3 添加.pch 文件

/**
 * 
 0 先简历.pch文件
 1、 在buildsetting 里添加 Perfix Header
 */

@end
