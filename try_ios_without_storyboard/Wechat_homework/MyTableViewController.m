//
//  MyTableViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/20.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCell.h"
#import "MyTableViewController.h"

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    dataSource = [[MyDataSource alloc] init];
    
    // weak property!!!!!
    self.mainTableView.dataSource = dataSource;
    self.mainTableView.delegate = self;
    // 从cell文件中获得cell的高度
    self.mainTableView.rowHeight = kMyCellHeight;
    
    [self.view addSubview:self.mainTableView];
    
#pragma mark -- 搜索栏
    //实例化UISearchController
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    //设置self为更新搜索结果对象
    self.searchController.searchResultsUpdater = self;
    //在搜索时，背景不模糊
    self.searchController.obscuresBackgroundDuringPresentation = FALSE;
    //设置搜索范围栏中的按钮
    self.searchController.searchBar.delegate = self;
    //将搜索栏放到表视图的表头中
    self.mainTableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit] ;
}


#pragma mark -- 搜索栏
- (void)filterContentForSearchText:(NSString *)searchText{
    if ([searchText length] == 0) {
        // 查询所有
        dataSource.filteredUserData = [NSMutableArray arrayWithArray:dataSource.allUserData];
        return;
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    
    scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
    tempArray = [dataSource.allUserData filteredArrayUsingPredicate:scopePredicate];
    dataSource.filteredUserData = [NSMutableArray arrayWithArray:tempArray];
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
    [self filterContentForSearchText:searchString];
    [self.mainTableView reloadData];
}


@end
