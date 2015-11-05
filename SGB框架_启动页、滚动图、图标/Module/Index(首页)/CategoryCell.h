//
//  CategoryCell.h
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/2.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "BaseTableCell.h"

typedef NS_ENUM(NSInteger, BMSortType) {
    BMSortTypeFood = BMSortCellImgTag,      // 1.美食
    BMSortTypeMovie,                        // 2.电影
    BMSortTypePlay,                         // 3.休闲
    BMSortTypeHappy,                        // 4.娱乐
    BMSortTypeBeauty,                       // 5.丽人
    BMSortTypeTravel,                       // 6.旅行
    BMSortTypeLife,                         // 7.生活服务
    BMSortTypeNew,                          // 8.今日新品
    BMSortTypeEat,                          // 9.小吃快餐
    BMSortTypeMore                          // 10.更多
};

@protocol CategoryCellDelegate <NSObject>

- (void)cellWithCategoryType:(BMSortType)sortType;

@end

@interface CategoryCell : BaseTableCell

@property (weak, nonatomic) id<CategoryCellDelegate> delegate;

@end
