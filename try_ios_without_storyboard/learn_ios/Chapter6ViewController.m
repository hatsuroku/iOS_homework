//
//  Chapter6ViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/17.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chapter6ViewController.h"




@implementation CustomCell

// 用代码编写自定义表视图单元格时，需要初始化其中的子视图
// 这个过程就是在这个构造函数内实现的
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //单元格的高度
        CGFloat cellHeight = self. frame. size.height;
        CGFloat imageViewWidth = 39;
        CGFloat imageViewHeight = 28;
        CGFloat imageViewLeftView= 300;
        
        ///1.添加ImageView
        self .myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeftView, (cellHeight - imageViewHeight) / 2, imageViewWidth, imageViewHeight)];
        [self addSubview:self .myImageView];
        
        ///2.添加标签
        CGFloat labelWidth = 120;
        CGFloat labelHeight = 21;
        CGFloat labelleftView =15;
        self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelleftView, (cellHeight - labelHeight) / 2, labelWidth, labelHeight)];
        [self addSubview:self.myLabel];
    }
    return self;
}

@end


@implementation Chapter6ViewController

- (void)viewDidLoad  {
    [super viewDidLoad];
    
#pragma mark -- UITableView
    NSString *plistPath =[[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
    
#pragma mark -- 索引
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *teamDictPath = [bundle pathForResource:@"team_dictionary" ofType:@"plist"];
//    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:teamDictPath];
//
//    NSArray *tempList = [self.dictData allKeys];
//    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
    
#pragma mark -- 搜索栏

    //查询所有数据
    [self filterContentForSearchText:@"" scope:-1];
    //实例化UISearchController
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    //设置self为更新搜索结果对象
    self.searchController.searchResultsUpdater = self;
    //在搜索时，设置背景为灰色
    self.searchController.obscuresBackgroundDuringPresentation = FALSE;
    //设置搜索范围栏中的按钮
    self.searchController.searchBar.scopeButtonTitles = @[@"中文", @"英文"];
    self.searchController.searchBar.delegate = self;
    //将搜索栏放到表视图的表头中
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit] ;
    

}

#pragma mark -- 搜索栏
- (void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope {
    if ([searchText length] == 0) {
        // 查询所有
        self.listFilterTeams = [NSMutableArray arrayWithArray:self.listTeams];
        return;
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    
    switch (scope) {
        case 0: // 中文，name字段是中文名
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
            tempArray = [self.listTeams filteredArrayUsingPredicate:scopePredicate];
            self.listFilterTeams = [NSMutableArray arrayWithArray:tempArray];
            break;
        case 1: // 英文，image字段保存英文名
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.image contains[c] %@", searchText];
            tempArray = [self.listTeams filteredArrayUsingPredicate:scopePredicate];
            self.listFilterTeams = [NSMutableArray arrayWithArray:tempArray];
            break;
        default:
            // 查询所有
            self.listFilterTeams = [NSMutableArray arrayWithArray:self.listTeams];
            break;
    }
}

#pragma mark -- 实现UISearchBarDelegate协议
// 点击搜索范围栏按钮的时候调用
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark -- 实现UISearchResultsUpdating协议方法
// 搜索栏成为第一响应者，并且内容被改变时调用
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    // 查询
    [self filterContentForSearchText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDataSource
- (NSInteger )tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section {
    return [self.listFilterTeams count];
}

//// 索引
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // 按照节索引从小组名中获得组名
//    NSString *groupName = self.listGroupname[section];
//    // 将组名作为key，从字典中取出球队数组集合
//    NSArray *listTeams = self.dictData[groupName];
//    return [listTeams count];
//}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 寻找可以重用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    // 如果没有可重用的cell，就new一个可以用来重用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }

    NSUInteger row = [indexPath row];

    NSDictionary *rowDict = self.listFilterTeams[row];
    cell.textLabel.text = rowDict[@"name"];

    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", rowDict[@"image"]];
    cell.imageView.image = [UIImage imageNamed: imagePath];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


//// 索引
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellIdentifier = @"CellIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
//    }
//
//    // 获得选择的节
//    NSUInteger section = [indexPath section];
//    // 获得选择节中选中的行索引
//    NSUInteger row = [indexPath row];
//    // 按照节索引从小组名数组中获得组名
//    NSString *groupName = self.listGroupname[section];
//    // 将组名作为key，从字典中取出球队数组集合
//    NSArray *listTeams = self.dictData[groupName];
//
//    cell.textLabel.text = listTeams[row];
//
//    return cell;
//}
//
//// 索引
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return [self.listGroupname count];
//}
//
//// 索引
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSString *groupName = self.listGroupname[section];
//    return groupName;
//}
//
//// 索引
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    NSMutableArray *listTitles = [NSMutableArray arrayWithArray:self.listGroupname];
//    return listTitles;
//}
@end
