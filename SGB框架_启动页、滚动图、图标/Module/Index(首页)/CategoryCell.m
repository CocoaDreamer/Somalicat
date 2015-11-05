
//
//  CategoryCell.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/2.
//  Copyright (c) 2015年 SGB. All rights reserved.
//
#define SortCellRowNum  11  // 每行图标的数量
#define SortImageRowNum 5   // 每行图标的数量
#import "CategoryCell.h"
@interface CategoryCell ()
@property (strong, nonatomic) NSArray * array_title;        // 1.标题名称集合
@property (strong, nonatomic) NSArray * array_imageName;    // 2.图片名称集合
@end
@implementation CategoryCell

- (void)setCellUI
{
    CGFloat imgW = BMSortCellImgH;  // 1.图标的宽度
    CGFloat imgH = imgW;            // 2.图标的高度
    CGFloat paddingImg = ( ScreenWidth - imgW * SortImageRowNum ) / (SortCellRowNum - SortImageRowNum); // 3.图标之间的间隔
    
    
    for (NSInteger i= 0; i < self.array_title.count; i++) {
        
        CGFloat imgX = paddingImg * (i % SortImageRowNum + 1) + imgW * (i % SortImageRowNum);
        CGFloat imgY;
        
        i < SortImageRowNum ? (imgY = Padding13):(imgY = 80);
        // 1. 设置图片
        UIImageView *imgView = [UIImageView imageViewWithImage:[UIImage imageNamed:self.array_imageName[i]]
                                                         frame:CGRectMake(imgX, imgY, imgW, imgH)];
        [imgView setTag:BMSortCellImgTag + i];
        [imgView addTarget:self
                    action:@selector(imageTag:)];
        [self.contentView addSubview:imgView];
        
        // 2. 设置标题
        UILabel *lb = [UILabel labelWithFrame:CGRectMake(0, 0, ScreenWidth/SortImageRowNum, BMSortCellLBH)
                                         text:self.array_title[i]
                                         size:12
                                        color:[UIColor grayColor]
                                    alignment:NSTextAlignmentCenter];
        [lb setTag:BMSortCellLBTag + i];
        lb.centerX = imgView.centerX;
        lb.centerY = imgView.centerY + (BMSortCellLBH + BMSortCellImgH) / 2;
        
        [self.contentView addSubview:lb];
    }

}

/**
 *  2.图片的点击事件
 *
 */
- (void)imageTag:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(cellWithCategoryType:)]) {
        [self.delegate cellWithCategoryType:[tap view].tag];
    }
}

/**
 *  3.数据懒加载
 *
 */

- (NSArray *)array_title
{
    if (_array_title == nil) {
        _array_title = @[@"美食",@"电影",@"休闲",@"娱乐",@"丽人",
                         @"旅行",@"生活服务",@"今日新品",@"小吃快餐",@"更多"];
    }
    return _array_title;
}

- (NSArray *)array_imageName
{
    if (_array_imageName == nil) {
        _array_imageName = @[@"food_bt", @"movie_bt", @"play_bt", @"happy_bt", @"beauty_bt",
                             @"travel_bt", @"life_bt", @"new_bt", @"eat_bt", @"more_bt"];
    }
    return _array_imageName;
}


@end
