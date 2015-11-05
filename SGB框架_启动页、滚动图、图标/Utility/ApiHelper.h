//
//  ErpApiHelper.h
//  LiudaTicket
//
//  Created by EricWei on 13-12-30.
//  Copyright (c) 2013年 MMC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "Singleton.h"
@interface ApiHelper : NSObject
typedef void (^CurrentResponseBlock)(id jsonObject);
typedef void (^ErrorResponseBlock)();
typedef void (^ErrorResponseBlockpara)(NSError* error);
//应用单例模式创建MKNetworkEngine
singleton_interface(ApiHelper);

//带菊花圈 获取MKNetworkOperation
-(MKNetworkOperation*) requestParam:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                  completionHandler:(CurrentResponseBlock)completionBlock
                       errorHandler:(ErrorResponseBlock)errorBlock;

-(MKNetworkOperation *) requestUploadParam:(NSMutableDictionary*)para  d_image:(NSData*)data  api_baseUrl:(NSString*)api_baseUrl        completionHandler:(CurrentResponseBlock)completionBlock
                              errorHandler:(ErrorResponseBlock)errorBlock;
//固定路径的api请求
-(MKNetworkOperation*) requestParam:(NSMutableDictionary*)para  targetView:(UIView*)targetView
                  completionHandler:(CurrentResponseBlock)completionBlock
                       errorHandler:(ErrorResponseBlock)errorBlock;
- (void)showFailMessage:(NSError *)error targetView:(UIView *)targetView;

-(MKNetworkOperation *) requestUploadParam:(NSMutableDictionary*)para  d_array_image:(NSMutableArray*)array_data  api_baseUrl:(NSString*)api_baseUrl        completionHandler:(CurrentResponseBlock)completionBlock
                              errorHandler:(ErrorResponseBlock)errorBlock;


/**
 * SGB 增加  提示信息
 */
-(MKNetworkOperation*) requestParam2:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                  completionHandler:(CurrentResponseBlock)completionBlock
                       errorHandler:(ErrorResponseBlock)errorBlock;

/**
 * SGB 增加  返回所有信息
 */
-(MKNetworkOperation*) requestParam3:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                   completionHandler:(CurrentResponseBlock)completionBlock
                        errorHandler:(ErrorResponseBlock)errorBlock;


/**
 * SGB 增加  请求提交数据返回信息 没有提示信息 */
-(MKNetworkOperation*) requestParam4:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                   completionHandler:(CurrentResponseBlock)completionBlock
                        errorHandler:(ErrorResponseBlock)errorBlock;


-(MKNetworkOperation*) requestParamNomsg:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl completionHandler:(CurrentResponseBlock)completionBlock
                            errorHandler:(ErrorResponseBlockpara)errorBlock;
-(MKNetworkOperation*) requestParamRemoveMsg:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl completionHandler:(CurrentResponseBlock)completionBlock
                                errorHandler:(ErrorResponseBlock)errorBlock;




/**
 * SGB 增加  接口测试用 */
-(MKNetworkOperation*) requestParamTest:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                   completionHandler:(CurrentResponseBlock)completionBlock
                        errorHandler:(ErrorResponseBlock)errorBlock;
@end
