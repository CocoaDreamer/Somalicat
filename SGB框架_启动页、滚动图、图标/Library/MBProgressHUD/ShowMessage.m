//
//  ShowMessage.m
//  IBeiGuo
//
//  Created by EricWei on 15/1/20.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import "ShowMessage.h"

@implementation ShowMessage
#pragma mark 纯文本的消息提示
+(void)showTextOnly:(NSString *)strMessage messageView:(UIView *)viewInfo
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewInfo animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = strMessage;
    hud.margin=10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:1];
    
}
#pragma mark 信息加载时返回一个实例MBProgressHUD
+(MBProgressHUD *)showLoadingData:(UIView *)viewInfo
{
    __weak MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewInfo animated:YES];
    
    hud.labelText = @"正在加载";
    hud.labelFont=[UIFont systemFontOfSize:12.0];
    hud.square = YES;
    hud.removeFromSuperViewOnHide=YES;
    
    return hud;
}

@end
