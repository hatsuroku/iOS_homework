//
//  MyDataSource.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/20.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyDataSource.h"
#import "MyCell.h"

@implementation MyDataSource

- (id)init {
    if (self = [super init]) {
        [self readDataFromJSONFile:@"sessions"];
    }
    return self;
}

- (void)readDataFromJSONFile:(NSString *)JSONFileName {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:JSONFileName ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    self.allUserData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.filteredUserData = [NSMutableArray arrayWithArray:self.allUserData];
}

// 某个section中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.filteredUserData count];
}

// 每一行的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 80;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CellIdentifier";
    // 寻找可以重用的cell
    
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 如果没有可重用的cell，就new一个可以用来重用的cell
    if (cell == nil) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //取得这一行数据
    NSDictionary *userData = self.filteredUserData[[indexPath row]];
    
    //刷新数据；
    [cell freshModelWithName:userData[@"name"]];
    [cell freshModelWithTime:userData[@"time"]];
    [cell freshModelWithAvatar:userData[@"picture"]];
    [cell freshModelWithMessage:userData[@"message"]];
    [cell freshModelWithUnreadCount:[userData[@"unreadCount"] intValue]];

    return cell;
}

@end
