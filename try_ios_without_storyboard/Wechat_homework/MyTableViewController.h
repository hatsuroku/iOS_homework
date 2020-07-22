//
//  MyTableViewController.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/20.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef MyTableViewController_h
#define MyTableViewController_h

#import <UIKit/UIKit.h>
#import "MyDataSource.h"

@interface MyViewController : UIViewController <UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating> {
    MyDataSource *dataSource;
}

@property (strong, nonatomic) UITableView *mainTableView;
@property (strong, nonatomic) UISearchController *searchController;

@end


#endif /* MyTableViewController_h */
