//
//  SearchDispalyController.m
//  SGB框架_启动页、滚动图、图标
//
//  Created by SGB on 15/9/16.
//  Copyright (c) 2015年 SGB. All rights reserved.
//

#import "SearchDispalyController.h"

@interface SearchDispalyController ()<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView_test;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar_test;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDC;
@property (strong, nonatomic) NSArray * arr_items;
@property (strong, nonatomic) NSArray * arr_searchResults;
@end

@implementation SearchDispalyController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr_items = @[@"国服第一臭豆腐 No.1 Stinky Tofu CN.",
                       @"瓦洛兰 Valoran",
                       @"德玛西亚 Demacia",
                       @"诺克萨斯 Noxus",
                       @"艾欧尼亚 Ionia",
                       @"皮尔特沃夫 Piltover",
                       @"弗雷尔卓德 Freijord",
                       @"班德尔城 Bandle City",
                       @"战争学院 The Institute of War",
                       @"祖安 Zaun",
                       @"卡拉曼达 Kalamanda",
                       @"蓝焰岛 Blue Flame Island",
                       @"哀嚎沼泽 Howling Marsh",
                       @"艾卡西亚 Icathia",
                       @"铁脊山脉 Ironspike Mountains",
                       @"库莽古丛林 Kumungu",
                       @"洛克法 Lokfar",
                       @"摩根小道 Morgon Pass",
                       @"塔尔贡山脉 Mountain Targon",
                       @"瘟疫丛林 Plague Jungles",
                       @"盘蛇河 Serpentine River",
                       @"恕瑞玛沙漠 Shurima Desert",
                       @"厄尔提斯坦 Urtistan",
                       @"巫毒之地 Voodoo Lands",
                       @"水晶之痕 Crystal Scar",
                       @"咆哮深渊 Howling Abyss",
                       @"熔岩洞窟 Magma Chambers",
                       @"试炼之地 Proving Grounds",
                       @"召唤师峡谷 Summoner's Rift",
                       @"扭曲丛林 Twisted Treeline"];
    //    UISearchController
}



#pragma mark - 通过搜索条件过滤得到搜索结果
- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate *pred_result = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",searchText];
    self.arr_searchResults = [self.arr_items filteredArrayUsingPredicate:pred_result];
}

#pragma mark - 代理_tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (tableView == self.tableView_test) ? self.arr_items.count:self.arr_searchResults.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str_id = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str_id];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str_id];
    }
    cell.textLabel.text = (tableView == self.tableView_test)?self.arr_items[indexPath.row]:self.arr_searchResults[indexPath.row];
    return cell;
}

#pragma mark - 代理_display

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString

{
    NSString *str_scope =  [self.searchDisplayController.searchBar scopeButtonTitles][self.searchDisplayController.searchBar.selectedScopeButtonIndex];
    [self filterContentForSearchText:searchString scope:str_scope];
    return YES;
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString *str_searchText = self.searchDisplayController.searchBar.text;
    NSString *str_scope = self.searchDisplayController.searchBar.scopeButtonTitles[searchOption];
    [self filterContentForSearchText:str_searchText scope:str_scope];
    return YES;
}

@end
