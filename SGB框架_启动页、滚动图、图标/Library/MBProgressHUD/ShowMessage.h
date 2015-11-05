//
//  ShowMessage.h
//  IBeiGuo
//
//  Created by EricWei on 15/1/20.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowMessage : NSObject
#pragma mark 纯文本的消息提示
+(void)showTextOnly:(NSString *)strMessage messageView:(UIView *)viewInfo;
#pragma mark 信息加载时返回一个实例MBProgressHUD
+(MBProgressHUD *)showLoadingData:(UIView *)viewInfo;
@end
