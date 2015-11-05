//
//  MyInformationView.h
//  代理测试Test
//
//  Created by SGB on 15/9/22.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyInformationViewDelegate <NSObject>

- (void)returnValueToShow:(NSInteger)index;

@end
@interface MyInformationView : UIView

@property (strong, nonatomic) id<MyInformationViewDelegate> myDelegate;

@end
