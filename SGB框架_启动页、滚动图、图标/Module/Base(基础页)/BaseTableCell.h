//
//  BaseTableCell.h
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/2.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView*)tableView;
- (void)setCellUI;
@end
