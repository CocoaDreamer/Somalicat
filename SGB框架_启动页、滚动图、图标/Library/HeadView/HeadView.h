//
//  HeadView.h
//  IBeiGuo
//
//  Created by SGB on 15/3/5.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopADModel.h"
//定义了一个IDBlock类型  这个类型  可以定义一个没有返回值  有一个int 参数的 block 变量
typedef void(^IDBlock) (NSDictionary *dic);
@interface HeadView : UIView<UIScrollViewDelegate>
singleton_interface(HeadView);



+ (HeadView *)createHeadViewWithAd_position:(NSString *)ad_position;
//变量  _block
//setter 和  getter方法
@property (nonatomic, copy) IDBlock block;

@end
