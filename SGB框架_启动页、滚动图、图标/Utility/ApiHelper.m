//
//  ErpApiHelper.m
//  LiudaTicket
//
//  Created by Eric on 13-12-30.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ApiHelper.h"
#import <Foundation/Foundation.h>
#import "ConfigAPI.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
//#define errorMsg @"系统服务忙，请稍后操作"
#define errorMsg @"当前网络不可用，请检查网络设置"
@implementation ApiHelper

/*
 * 应用单例模式创建MKNetworkEngine
 */
singleton_implementation(ApiHelper)





#pragma mark - 基于短路径的请求
/**
 *  基于短路径的请求
 *
 *  @param para            请求参数（字典）
 *  @param api_baseUrl     短路径
 *  @param targetView      当前视图
 *  @param completionBlock 返回结果后的业务逻辑处理Block
 *  @param errorBlock      请求发生错误之后的业务处理Block
 *
 *  @return 返回当前实例化的Operation  
 */
-(MKNetworkOperation*) requestParam:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                  completionHandler:(CurrentResponseBlock)completionBlock
                       errorHandler:(ErrorResponseBlock)errorBlock
{
    [ShowMessage showLoadingData:targetView];
    //拼接参数且加密
    //-To do
    if (para==nil) {
        para=[NSMutableDictionary dictionary];
    }
//    NSMutableDictionary *dic_para = [SGBControl createTokenJoinByDic:para];
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    
    
    
    
    
//    op.re
    
//    [op setFreezable:YES];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
        //状态码
         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
         //消息提示
         NSString *strMsg=[strBody objectForKey:@"msg"];
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         
         if (statusCode==101)
         {
    
              id strReturnobject=[strBody objectForKey:@"result"];
              completionBlock(strReturnobject);
         }
         else
         {
             [ShowMessage showTextOnly:strMsg messageView:targetView];
             errorBlock();
         }
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         [self showFailMessage:error targetView:targetView];
          errorBlock();
         [ApplicationDelegate.apiEngine cancelAllOperations];
        
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
}
#pragma mark - 固定路径的api请求
/**
 *  固定路径的api请求
 *
 *  @param para            请求参数（字典）
 *  @param targetView      当前视图
 *  @param completionBlock 返回结果后的业务逻辑处理Block
 *  @param errorBlock      请求发生错误之后的业务处理Block
 *
 *  @return 返回当前实例化的Operation
 */
-(MKNetworkOperation*) requestParam:(NSMutableDictionary*)para  targetView:(UIView*)targetView
                  completionHandler:(CurrentResponseBlock)completionBlock
                       errorHandler:(ErrorResponseBlock)errorBlock
{
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:@"" params:para
                                                                   httpMethod:API_HttpMethod];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (statusCode==200)
         {
             id strReturnobject=[strBody objectForKey:@"result"];
             completionBlock(strReturnobject);
         }
         else
         {
             NSString *strMsg=[strBody objectForKey:@"msg"];
             [ShowMessage showTextOnly:strMsg messageView:targetView];
//             if (![strMsg isEqual:@"请求成功"]) {
//                 [ShowMessage showTextOnly:strMsg messageView:targetView];
//             }
         }
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         [self showFailMessage:error targetView:targetView];
         [ApplicationDelegate.apiEngine cancelAllOperations];
         errorBlock();
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
    
}
#pragma mark - 请求失败之后提示信息
//请求失败之后提示信息
/**
 *  -1003://域名不可访问
 *  -1004://无法连接服务器
 *   405: //拒绝访问
 *   500: //服务器内部错误
 *  -1009://网络无连接。模拟器一直返回此状态。
 *  -1001://网络请求超时
 *  @param error      请求返回的错误对象
 *  @param targetView 当前视图
 */
- (void)showFailMessage:(NSError *)error targetView:(UIView *)targetView
{
    NSString *strMsg=nil;
    long errorCode=[error code];
    
    NSLog(@"错误码是%li",errorCode);
    switch ([error code])
    {
        case -1009://网络无连接。模拟器一直返回此状态。
            strMsg=@"当前网络不可用，请检查网络设置";
            break;
        case -1001://网络请求超时
            strMsg=@"网络请求超时";
            break;
        default:
            strMsg=errorMsg;
            //[UIAlertView showWithError:error];
            break;
    }
    [ShowMessage showTextOnly:strMsg messageView:targetView];
}
#pragma mark - 异步上传图片
/**
 *异步上传图片
 **/
-(MKNetworkOperation *) requestUploadParam:(NSMutableDictionary*)para  d_image:(NSData*)data  api_baseUrl:(NSString*)api_baseUrl   completionHandler:(CurrentResponseBlock)completionBlock errorHandler:(ErrorResponseBlock)errorBlock
{
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl
                                                                       params:para
                                                                   httpMethod:API_HttpMethod];
    [op addHeader:@"Content-Type" withValue:@"multipart/form-data"];
    //[op addFile:data forKey:@"image"];
    [op addData:data forKey:@"image"];
     [op setFreezable:YES];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
         completionBlock(strBody);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         if (errorOp!=nil) {
             [errorOp cancel];
             errorOp=nil;
         }
         errorBlock(error);
         [UIAlertView showWithError:error];
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
}

/**
 *异步上传图片
 **/
-(MKNetworkOperation *) requestUploadParam:(NSMutableDictionary*)para  d_array_image:(NSMutableArray*)array_data  api_baseUrl:(NSString*)api_baseUrl        completionHandler:(CurrentResponseBlock)completionBlock
                              errorHandler:(ErrorResponseBlock)errorBlock
{
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl
                                                                       params:para
                                                                   httpMethod:API_HttpMethod];
    [op addHeader:@"Content-Type" withValue:@"multipart/form-data"];
    //[op addFile:data forKey:@"image"];
    for (int i=0; i<array_data.count; i++)
    {
        NSData *data=UIImageJPEGRepresentation(array_data[i], 0);
        [op addData:data forKey:[NSString stringWithFormat:@"image%d",i]];
    }
//    [op addData:data forKey:@"image"];
    [op setFreezable:YES];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
         completionBlock(strBody);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         if (errorOp!=nil) {
             [errorOp cancel];
             errorOp=nil;
         }
         errorBlock(error);
         [UIAlertView showWithError:error];
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
}



/**
 * SGB 增加  请求提交数据返回信息 提示信息
 */
-(MKNetworkOperation*) requestParam2:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                   completionHandler:(CurrentResponseBlock)completionBlock
                        errorHandler:(ErrorResponseBlock)errorBlock
{
    [ShowMessage showLoadingData:targetView];
    //拼接参数且加密
    //-To do
    if (para==nil) {
        para=[NSMutableDictionary dictionary];
    }
//    NSMutableDictionary *dic_para = [SGBControl createTokenJoinByDic:para];
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    
    
    

//    [op setFreezable:YES];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
//         id strBody=[completedOperation responseString];
         
//         NSLog(@"************");
//         NSLog(@"****%@",strBody);
//         NSLog(@"************");
      id strBody=[completedOperation responseJSON];
         

         //状态码
         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
         
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         

         if (statusCode==101)
         {

             id strReturnobject= strBody;
             completionBlock(strReturnobject);
         }
         else
         {
             [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
             NSString *strMsg=[strBody objectForKey:@"msg"];
             [ShowMessage showTextOnly:strMsg messageView:targetView];
             errorBlock();
         }
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         
         
//         NSLog(@"************");
//         NSLog(@"****%@%@",error.description,errorOp);
//         NSLog(@"************");
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         [self showFailMessage:error targetView:targetView];
         errorBlock();
         [ApplicationDelegate.apiEngine cancelAllOperations];
         
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;

}



/**
 * SGB 增加  请求提交数据返回信息 提示信息
 */
-(MKNetworkOperation*) requestParam3:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                   completionHandler:(CurrentResponseBlock)completionBlock
                        errorHandler:(ErrorResponseBlock)errorBlock
{
    [ShowMessage showLoadingData:targetView];
    //拼接参数且加密
    //-To do
    
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    
//    [op setFreezable:YES];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (statusCode==200)
         {
             id strReturnobject= strBody;
             completionBlock(strReturnobject);
         }
         else
         {
             [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
             NSString *strMsg=[strBody objectForKey:@"msg"];
             [ShowMessage showTextOnly:strMsg messageView:targetView];
             errorBlock();
         }
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         [self showFailMessage:error targetView:targetView];
         errorBlock();
         [ApplicationDelegate.apiEngine cancelAllOperations];
         
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
}


/**
 * SGB 增加  请求提交数据返回信息 没有提示信息 */
-(MKNetworkOperation*) requestParam4:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                   completionHandler:(CurrentResponseBlock)completionBlock
                        errorHandler:(ErrorResponseBlock)errorBlock
{

    //拼接参数且加密
    //-To do
    
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    
    //    [op setFreezable:YES];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
//         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (statusCode == 200 || statusCode == 201) {
             id strReturnobject= strBody;
             completionBlock(strReturnobject);
         }else{
             errorBlock();
         }
        

     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {

         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }

         errorBlock();
         [ApplicationDelegate.apiEngine cancelAllOperations];
         
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
}

-(MKNetworkOperation*) requestParamNomsg:(NSMutableDictionary *)para api_baseUrl:(NSString *)api_baseUrl completionHandler:(CurrentResponseBlock)completionBlock errorHandler:(ErrorResponseBlockpara)errorBlock
{
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         
         id strBody=[completedOperation responseJSON];
         //         NSLog(@"***********************");
         //         NSLog(@"%@",strBody);
         //         NSLog(@"***********************");
         //         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
         //         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         //         if (statusCode==200)
         //         {
         //             id strReturnobject=[strBody objectForKey:@"result"];
         completionBlock(strBody);
         //         }
         //         else
         //         {
         //             NSString *strMsg=[strBody objectForKey:@"msg"];
         //             [ShowMessage showTextOnly:strMsg messageView:targetView];
         //         }
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         //         [MBProgressHUD hideAllHUDsForView:targetView animated:YES];
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         
         [ApplicationDelegate.apiEngine cancelAllOperations];
         errorBlock(error);
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
    
}



-(MKNetworkOperation*) requestParamRemoveMsg:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl completionHandler:(CurrentResponseBlock)completionBlock
                       errorHandler:(ErrorResponseBlock)errorBlock
{
    //拼接参数且加密
    //-To do

    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    
    //    [op setFreezable:YES];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
         NSInteger statusCode=[[strBody objectForKey:@"code"] integerValue];
         if (statusCode==200)
         {
             id strReturnobject=[strBody objectForKey:@"result"];/**
                                                                  *  id strReturnobject=strBody[@"code"];
                                                                  completionBlock(strReturnobject);
                                                                  */
             completionBlock(strReturnobject);
         }else if(statusCode == 201){
             
             id strReturnobject=strBody[@"code"];
             completionBlock(strReturnobject);
         }
         
         else
         {
             errorBlock();
            
         }
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         errorBlock();
         [ApplicationDelegate.apiEngine cancelAllOperations];
         
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;
    
}






/**
 * SGB  接口测试专用
 */

-(MKNetworkOperation*) requestParamTest:(NSMutableDictionary*)para api_baseUrl:(NSString*)api_baseUrl targetView:(UIView*)targetView
                      completionHandler:(CurrentResponseBlock)completionBlock
                           errorHandler:(ErrorResponseBlock)errorBlock
{
    //拼接参数且加密
    //-To do
    
    MKNetworkOperation *op = [ApplicationDelegate.apiEngine operationWithPath:api_baseUrl params:para
                                                                   httpMethod:API_HttpMethod];
    
    //    [op setFreezable:YES];
    //执行操作返回结果，否则捕获异常
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         id strBody=[completedOperation responseJSON];
        
     
         completionBlock(strBody);
     
     
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error)
     {
         if (errorOp!=nil)
         {
             [errorOp cancel];
             errorOp=nil;
         }
         errorBlock();
         [ApplicationDelegate.apiEngine cancelAllOperations];
         
     }];
    
    [ApplicationDelegate.apiEngine enqueueOperation:op];
    
    return op;

}


@end
