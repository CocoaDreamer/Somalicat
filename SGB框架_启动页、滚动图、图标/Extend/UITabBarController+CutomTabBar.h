

#import <UIKit/UIKit.h>

//自定义taBbar
@interface UITabBarController (CutomTabBar)
- (void)tabBarWithImageArray:(NSArray *)imageArray
                  titleArray:(NSArray *)titleArray
               selectedColor:(UIColor *)selectedColor;
@end
