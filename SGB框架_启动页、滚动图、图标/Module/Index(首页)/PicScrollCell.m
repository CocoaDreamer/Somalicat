//
//  PicScrollCell.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/2.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "PicScrollCell.h"

@implementation PicScrollCell

- (void)setCellUI
{
    self.view_pic_scroll = [HeadView  createHeadViewWithAd_position:@"index"];
    [self.contentView addSubview:self.view_pic_scroll];
}

@end
