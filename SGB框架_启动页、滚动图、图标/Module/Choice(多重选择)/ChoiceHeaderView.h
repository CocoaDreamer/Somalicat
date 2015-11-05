//
//  ChoiceHeaderView.h
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/29.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceHeaderView : UITableViewHeaderFooterView
@property (strong, nonatomic) IBOutlet UIButton *button_select;
@property (strong, nonatomic) IBOutlet UILabel *label_name;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_arrow;
@property (strong, nonatomic) UITapGestureRecognizer *tap_head;
@end
