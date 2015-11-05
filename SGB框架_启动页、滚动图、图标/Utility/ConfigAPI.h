//
//  ConfigAPI.h
//  ErpApp
//
//  Created by Eric on 13-12-31.
//
//

#ifndef ErpApp_ConfigAPI_h
#define ErpApp_ConfigAPI_h




#define ScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]  


#pragma mark - 判断是否是IOS7
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)


#pragma mark - api地址
#define API_HOSTNAME        @"www.ibeiguo.com"
//#define API_HOSTNAME        @"localhost:3000"


#pragma mark - sqlite数据库名
#define DB_NAME             @"ibeiguo.db"

#pragma mark - api请求方式
//#define API_HttpMethod      @"POST"
#define API_HttpMethod      @"GET"


#define API_ShopIndexGetAd @"/api.php/Index/getAd"
#define PIC_SCROLL_HEIGHT ScreenWidth/3*1



#define BMSortCellH      146    // 1.BMSortCell的高度
#define BMSortCellImgH   40     // 2.BMSortCell的图标的高度
#define BMSortCellLBH    26     // 3.BMSortCell的Label的高度
#define BMSortCellImgTag 11200   // 4.BMSortCell的图片的tag值
#define BMSortCellLBTag  11210   // 5.BMSortCell的图片的tag值



#define Padding5    5   // 间隔为5个像素
#define Padding8    8   // 间隔为8个像素
#define Padding10   10  // 间隔为10个像素
#define Padding13   13  // 间隔为13个像素
#define Padding15   15  // 间隔为15个像素
#define Padding20   20  // 间隔为20个像素
#define Padding22   22  // 间隔为22个像素
#define Padding25   25  // 间隔为25个像素
#define Padding30   30  // 间隔为30个像素
#define Padding40   40  // 间隔为40个像素
#define Padding44   44  // 间隔为44个像素
#define Padding100  100 // 间隔为100个像素



#pragma mark - 测试json数据API
#define API_TestDb                  @"/db"
#define API_TestComments            @"/comments"


#endif
