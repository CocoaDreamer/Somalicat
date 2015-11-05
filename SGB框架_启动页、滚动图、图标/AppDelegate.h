//
//  AppDelegate.h
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/1.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KEY (NSString *)kCFBundleVersionKey
#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MKNetworkEngine *apiEngine;
@property  BOOL isFirstLaunch;
@end

