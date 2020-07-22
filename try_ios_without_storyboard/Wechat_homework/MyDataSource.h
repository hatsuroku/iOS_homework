//
//  MyDataSource.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/20.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef MyDataSource_h
#define MyDataSource_h

#import <UIKit/UIKit.h>

@interface MyDataSource : NSObject <UITableViewDataSource>

// 存储从JSON中读取的数据，是一个Array
// 每一项的字段包括 _id, picture, name, message, time, unreadCount
@property NSMutableArray *allUserData;
// 用于存放搜索后的结果
@property NSMutableArray *filteredUserData;


- (void)readDataFromJSONFile:(NSString *)JSONFileName;


@end

#endif /* MyDataSource_h */
