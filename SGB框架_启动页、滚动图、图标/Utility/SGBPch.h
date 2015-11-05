//
//  SGBPch.h
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/1.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#ifndef SGB______________SGBPch_h
#define SGB______________SGBPch_h

#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "ConfigAPI.h"
#import "ApiHelper.h"
#import "ShowMessage.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+Tap.h"
#import "BaseTableCell.h"
#import "STKit.h"
#import "UIViewController+WRBNavigationItemExtension.h"
#import "DJRegisterView.h"
#import "NavLeftBackController.h"
#import "Utility.h"
#endif



/**
 *  当Xcode为Release时不输出，为Debug时输出
 */




//#ifdef DEBUG
//#define NSLog(...) NSLog(__VA_ARGS__)
//#define debugMethod() NSLog(@"%s", __func__)
//#else
//#define NSLog(...)
////#define debugMethod()
////#endif
//
//
//#ifndef __OPTIMIZE__
////#define NSLog(...) NSLog(__VA_ARGS__)
//
///**
// *  打印的时候可以看到类名、方法以及行数
// *
// */
//#define NSLog(fmt,...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
//
//#else
//#define NSLog(...) {}
//#endif

#endif
