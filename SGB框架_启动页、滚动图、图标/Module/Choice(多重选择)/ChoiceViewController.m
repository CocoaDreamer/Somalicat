//
//  ChoiceViewController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/29.
//  Copyright © 2015年 SGB. All rights reserved.
//

#import "ChoiceViewController.h"
#import "ChoiceCell.h"
#import "ChoiceHeaderView.h"



@interface ChoiceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView_choice;
@property (strong, nonatomic) NSMutableDictionary * dic_data;
@property (strong, nonatomic) NSArray * arr_data;
@property (strong, nonatomic) NSMutableArray * arr_expand;
@property (strong, nonatomic) NSMutableArray * arr_select;



- (IBAction)btnClickArray:(UIButton *)sender;



@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets= NO;
    
    /**
     * 0 加载数据
     */
    
    NSString *str_path = [[NSBundle mainBundle]pathForResource:@"role"  ofType:@"plist"];
    NSMutableArray *arr_wai = [[NSMutableArray alloc]initWithContentsOfFile:str_path];
    NSLog(@"************");
    NSLog(@"****%@",arr_wai);
    NSLog(@"************");
    for (NSInteger i = 0; i < arr_wai.count; i++) {
        NSArray *arr_list = arr_wai[i][@"list"];
        NSMutableArray *arr_obj = [NSMutableArray arrayWithCapacity:0];
        for (NSInteger j = 0; j < arr_list.count; j++) {
            [arr_obj addObject:arr_list[j]];
        }
        [self.dic_data setObject:arr_obj forKey:arr_wai[i][@"name"]];
    }
    self.arr_data = [self.dic_data allKeys];
    NSLog(@"************");
    NSLog(@"****%@",self.arr_data);
    NSLog(@"************");
    
    
    /**
     * 1、设置tableFooterView
     */
    self.tableView_choice.tableFooterView = [UIView new];
    [self.tableView_choice registerNib:[UINib nibWithNibName:NSStringFromClass([ChoiceHeaderView class]) bundle: nil] forHeaderFooterViewReuseIdentifier:@"ChoiceHeaderView"];
    [self.tableView_choice setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
}


#pragma mark - 代理_tableivew

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arr_data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *str_key = self.arr_data[section];
    NSArray *arr_key = self.dic_data[str_key];
    if ([self.arr_expand containsObject:str_key]) {
        return arr_key.count;
    }else{
        return 0.5;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
#pragma mark - 头部
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *str_key = self.arr_data[section];
    NSArray *arr_key = self.dic_data[str_key];
    ChoiceHeaderView *view_choiceHead = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ChoiceHeaderView"];
    view_choiceHead.label_name.text = str_key;
    view_choiceHead.button_select.tag = section;
    
    BOOL bool_selectAll = YES;
    for (id object in arr_key) {
        if (![self.arr_select containsObject:object]) {
            bool_selectAll = NO;
        }
    }
    view_choiceHead.button_select.selected = bool_selectAll;
    [view_choiceHead.button_select addTarget:self action:@selector(buttonClickHeader:) forControlEvents:UIControlEventTouchUpInside];
    [view_choiceHead.tap_head addTarget:self action:@selector(tapHeaderView:)];
    if ([self.arr_expand containsObject:str_key]) {
        view_choiceHead.imageView_arrow.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        view_choiceHead.imageView_arrow.transform = CGAffineTransformIdentity;
    }
    return view_choiceHead;
}

#pragma mark - 事件_头部
- (void)buttonClickHeader:(UIButton *)button
{
    NSString *str_key = self.arr_data[button.tag];
    NSArray *arr_key = self.dic_data[str_key];
    if (button.selected) {
        [self.arr_select removeObjectsInArray:arr_key];
    }else{
        [self.arr_select addObjectsFromArray:arr_key];
    }
    button.selected  = !button.selected;
    [self.tableView_choice reloadSections:[NSIndexSet indexSetWithIndex:button.tag ] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)tapHeaderView:(UITapGestureRecognizer *)tap
{
    ChoiceHeaderView *view = (ChoiceHeaderView *)tap.view;
    NSString *key = view.label_name.text;
    NSInteger index = [self.arr_data indexOfObject:key];
    if ([self.arr_expand containsObject:key]) {
        [self.arr_expand removeObject:key];
        [UIView animateWithDuration:0.1 animations:^{
            view.imageView_arrow.transform = CGAffineTransformIdentity;
        }];
    }else{
        [self.arr_expand addObject:key];
        [UIView animateWithDuration:0.1 animations:^{
            view.imageView_arrow.transform = CGAffineTransformMakeRotation(M_PI_2);
        }];
    }
    [self.tableView_choice reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark - cell_重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str_key = self.arr_data[indexPath.section];
    NSArray *arr_key = self.dic_data[str_key];
    NSString *str_name = arr_key[indexPath.row];
    ChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChoiceCell" forIndexPath:indexPath];
    
    if ([self.arr_select containsObject:str_name]) {
       
        cell.button_select.selected = YES;
    }else{
        cell.button_select.selected = NO;
    }
    cell.label_name.text = str_name;
    return cell;
}


#pragma mark - cell_点击

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSLog(@"************");
    NSLog(@"****您点击了%s",__func__);
    NSLog(@"************");
    NSString *str_key = self.arr_data[indexPath.section];
    NSArray *arr_key = self.dic_data[str_key];
    NSString *str_name = arr_key[indexPath.row];
    if ([self.arr_select containsObject:str_name]) {
        [self.arr_select removeObject:str_name];
    }else{
        [self.arr_select addObject: str_name];
    }
    [self.tableView_choice reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
}














#pragma mark - 方法_getter
- (NSArray *)arr_data{
    if (!_arr_data) {
        _arr_data = [NSArray array];
    }
    return _arr_data;
}




- (NSMutableDictionary *)dic_data
{
    if (!_dic_data) {
        _dic_data = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _dic_data;
}

- (NSMutableArray *)arr_expand
{
    if (!_arr_expand) {
        _arr_expand = [NSMutableArray arrayWithCapacity:0];
    }
    return _arr_expand;
}

- (NSMutableArray *)arr_select
{
    if (!_arr_select) {
        _arr_select = [NSMutableArray arrayWithCapacity:0];
    }
    return _arr_select;
}


#pragma mark - 事件_选中数组
- (IBAction)btnClickArray:(UIButton *)sender {
    NSLog(@"************");
    NSLog(@"****%s选中数组%@",__func__,self.arr_select);
    NSLog(@"************");
}
@end
