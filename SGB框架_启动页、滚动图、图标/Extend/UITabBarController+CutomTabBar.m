

#import "UITabBarController+CutomTabBar.h"

@implementation UITabBarController (CutomTabBar)
- (void)tabBarWithImageArray:(NSArray *)imageArray
                     titleArray:(NSArray *)titleArray
                  selectedColor:(UIColor *)selectedColor
{
    
    //自定义tabBar
    
    //0. 背景图
//    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg_normal"];
    
    //1. 设置正常图标选中图标
    
    //10 设置图标数组
    
    for (int i = 0; i < imageArray.count; i++) {
        
        //0设置图片
        NSString *str = [NSString stringWithFormat:@"%@normal",imageArray[i]];
        NSString *selectedStr = [NSString stringWithFormat:@"%@selected",imageArray[i]];
        //[self.tabBar.items[i] setFinishedSelectedImage:[UIImage imageNamed:selectedStr] withFinishedUnselectedImage:[UIImage imageNamed:str]];
        UIImage *image = [[UIImage imageNamed:str]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *seletedImage = [[UIImage imageNamed:selectedStr]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        //1 设置图片和标题
        [self.tabBar.items[i] initWithTitle:titleArray[i] image:image selectedImage:seletedImage];
        
    
        //2.1未选中
        [self.tabBar.items[i] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
        
        //2.2选中
        [self.tabBar.items[i] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectedColor} forState:UIControlStateSelected];
    }

}
@end
