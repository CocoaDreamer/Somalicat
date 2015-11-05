//
//  BaseTableCell.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/2.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "BaseTableCell.h"

@implementation BaseTableCell

+ (instancetype)cellWithTableView:(UITableView*)tableView
{
    NSString *strClass = [NSString stringWithFormat:@"%@", [self class]];
    UITableViewCell *cell = (UITableViewCell *)[super class];
    cell = [tableView dequeueReusableCellWithIdentifier:strClass];
    if (cell == nil) {
        cell = [[[super class] alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:strClass];
    }
    return (BaseTableCell *)cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setCellUI];
    }
    return self;
}

- (void)setCellUI
{
}


@end
