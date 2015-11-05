//
//  ChoiceCell.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/29.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "ChoiceCell.h"

@implementation ChoiceCell

- (void)awakeFromNib {
    // Initialization code
    [self.button_select setImage:[UIImage imageNamed:@"deselect"] forState:UIControlStateNormal];
    [self.button_select setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
