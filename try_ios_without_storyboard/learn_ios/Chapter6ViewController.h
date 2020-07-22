//
//  Chapter6ViewController.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/17.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef Chapter6ViewController_h
#define Chapter6ViewController_h

#import <UIKit/UIKit.h>


@interface Chapter6ViewController : UIViewController
@end


#pragma mark -- TabelView的delegate
@interface Chapter6ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end


#pragma mark -- 搜索栏的Delegate
@interface Chapter6ViewController () <UISearchBarDelegate, UISearchResultsUpdating>
@property (strong, nonatomic) UISearchController *searchController;
// 全部数据
@property (strong, nonatomic) NSArray *listTeams;
// 过滤后的数据
@property (strong, nonatomic) NSMutableArray *listFilterTeams;

//内容过滤方法
- (void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope;
@end

#pragma mark -- 分组标签
#pragma mark -- 搜索栏的Delegate
@interface Chapter6ViewController ()
// 从team_dictionary.plist文件中读取出来的数据
@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listGroupname;
@end

@interface CustomCell : UITableViewCell

@property (strong, nonatomic) UILabel *myLabel;
@property (strong, nonatomic) UIImageView *myImageView;

@end

#endif /* Chapter6ViewController_h */
