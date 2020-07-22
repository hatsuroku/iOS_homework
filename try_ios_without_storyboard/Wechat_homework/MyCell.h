//
//  MyCell.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/20.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef MyCell_h
#define MyCell_h

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>

// 单元格的高度，在实现文件中定义
extern const CGFloat kMyCellHeight;

@interface MyCell : UITableViewCell

@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UILabel *message;
@property (strong, nonatomic) UILabel *time;
@property (strong, nonatomic) UIImageView *avatar;
@property (strong, nonatomic) UILabel *unreadCount;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

#pragma mark -- 更新数据的方法
- (void)freshModelWithAvatar:(NSString *)avatarURL;
- (void)freshModelWithName:(NSString *)name;
- (void)freshModelWithMessage:(NSString *)message;
- (void)freshModelWithTime:(NSString *)time;
- (void)freshModelWithUnreadCount:(NSInteger)unreadCount;

@end



#endif /* MyCell_h */
