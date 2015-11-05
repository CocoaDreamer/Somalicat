//
//  SGBSegControl.h
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/7.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGBSegControl : UISegmentedControl
@property (copy,nonatomic) void (^action)(SGBSegControl *segControl);
@end


/**
 * 
 
 typedef void(^IDBlock) (NSDictionary *dic);
 */