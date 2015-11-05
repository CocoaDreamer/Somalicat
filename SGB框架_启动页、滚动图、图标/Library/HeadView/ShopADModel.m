//
//  ShopADModel.m
//  IBeiGuo
//
//  Created by SGB on 15/4/7.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import "ShopADModel.h"

@implementation ShopADModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+ (instancetype)shopADWithDict:(NSDictionary *)dict

{
    
    return [[ShopADModel alloc]initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict

{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    return self;
    
}
@end
