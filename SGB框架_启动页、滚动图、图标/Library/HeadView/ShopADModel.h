//
//  ShopADModel.h
//  IBeiGuo
//
//  Created by SGB on 15/4/7.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopADModel : NSObject
/**
 *
 "ad_img" = "http://121.42.138.242:9080/Uploads/Picture/2015-03-04/b21c8701a18b87d6d1ee8218040828381f30fd0d.jpg";
 "ad_title" = "\U798f\U6c14\U6ee1\U6ee1\U8fce\U65b0\U5e74";
 "ad_type" = goods;
 "ad_value" = 1;
 */

@property (copy, nonatomic) NSString *ad_img;
@property (copy, nonatomic) NSString *ad_title;
@property (copy, nonatomic) NSString *ad_type;
@property (copy, nonatomic) NSString *ad_value;
+ (instancetype)shopADWithDict:(NSDictionary *)dict;//类方法
- (instancetype)initWithDict:(NSDictionary *)dict;//实例方法



@end
