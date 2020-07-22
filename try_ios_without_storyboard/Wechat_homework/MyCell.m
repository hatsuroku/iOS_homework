//
//  MyCell.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/20.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCell.h"

const CGFloat kMyCellHeight = 80;

@implementation MyCell

#pragma mark -- 初始化以及位置调整函数
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.avatar];
        [self addSubview:self.message];
        [self addSubview:self.name];
        [self addSubview:self.time];
        [self addSubview:self.unreadCount];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self adjustPosition];
}

- (void)adjustPosition {
    // 头像的高度，同时也是中间整个盒子模型的高度
    CGFloat boxHeight = 50;
    
    CGFloat yPadding = (kMyCellHeight - boxHeight) / 2;
    CGFloat xPadding = 15;
    // 由于文本和头像处于同一高度会显得怪怪的，所以在顶部增量一个padding
    CGFloat labelTopPadding = yPadding * 0.3;
    // 各种文本的高度
    CGFloat labelHeight = 20;
    
    CGFloat nameWidth = 200;
    CGFloat messageWidth = 230;
    CGFloat timeWidth = 80;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kMyCellHeight);
    self.avatar.frame = CGRectMake(xPadding, yPadding, boxHeight, boxHeight);
    self.name.frame = CGRectMake(self.avatar.frame.origin.x + self.avatar.frame.size.width + xPadding,
                                 yPadding + labelTopPadding,
                                 nameWidth,
                                 labelHeight);
    self.message.frame = CGRectMake(self.name.frame.origin.x,
                                    self.name.frame.origin.y + self.name.frame.size.height + labelTopPadding,
                                    messageWidth,
                                    labelHeight);
    self.time.frame = CGRectMake(self.bounds.size.width - timeWidth - xPadding,
                                 yPadding + labelTopPadding,
                                 timeWidth,
                                 labelHeight);
    
    
    CGFloat unreadCountBadgeRadius = self.unreadCount.frame.size.width / 2;
    self.unreadCount.frame = CGRectMake(self.avatar.frame.origin.x + self.avatar.frame.size.width - unreadCountBadgeRadius,
                                        yPadding - unreadCountBadgeRadius,
                                        self.unreadCount.frame.size.width,
                                        self.unreadCount.frame.size.height);
//    self.unreadCount.hidden = YES;
}

#pragma mark -- getters
- (UIImageView *)avatar {
    if (!_avatar) {
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar.jpg"]];
    }
    return _avatar;
}

- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.text = @"吃屎啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:18.f weight:UIFontWeightBold];
        _name.textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    }
    return _name;
}

- (UILabel *)message {
    if (!_message) {
        _message = [[UILabel alloc] init];
        _message.text = @"信息啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        _message.font = [UIFont systemFontOfSize:15.f weight:UIFontWeightMedium];
        _message.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
    }
    return _message;
}

- (UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] init];
        _time.text = @"12:00";
        _time.textAlignment = NSTextAlignmentRight;
        _time.font = [UIFont systemFontOfSize:13.f weight:UIFontWeightMedium];
        _time.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
    }
    return _time;
}

- (UILabel *)unreadCount {
    if (!_unreadCount) {
        _unreadCount = [[UILabel alloc] init];
        _unreadCount.text = @"1";
        _unreadCount.font = [UIFont systemFontOfSize:13.f weight:UIFontWeightRegular];
        _unreadCount.textAlignment = NSTextAlignmentCenter;
        _unreadCount.backgroundColor = [UIColor redColor];
        _unreadCount.textColor = [UIColor whiteColor];
        CGFloat unreadCountBadgeRadius = 10;
        _unreadCount.frame = CGRectMake(_unreadCount.frame.origin.x,
                                        _unreadCount.frame.origin.y,
                                        unreadCountBadgeRadius * 2,
                                        unreadCountBadgeRadius * 2);
        _unreadCount.layer.cornerRadius = unreadCountBadgeRadius;
        _unreadCount.layer.masksToBounds = YES;
    }
    return _unreadCount;
}

#pragma mark -- 更新model
- (void)freshModelWithAvatar:(NSString *)avatarURL {
    NSURL *url = [NSURL URLWithString:avatarURL];
//    NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"avatar" ofType:@"jpg"]];
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//    [self.avatar setImage:image];
    [self.avatar sd_setImageWithURL:url];
}

- (void)freshModelWithName:(NSString *)name {
    self.name.text = name;
}

- (void)freshModelWithMessage:(NSString *)message {
    self.message.text = message;
}

- (void)freshModelWithTime:(NSString *)time {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *nowString = [dateFormatter stringFromDate:[NSDate date]];
    NSString *todayZeroClockString = [NSString stringWithFormat:@"%@00:00:00",[nowString substringToIndex:11]];
    NSString *thisYearZeroClockString = [NSString stringWithFormat:@"%@01-01 00:00:00",[nowString substringToIndex:5]];
    
    NSDate *todayZeroClock = [dateFormatter dateFromString:todayZeroClockString];
    NSDate *thisYearZeroClock = [dateFormatter dateFromString:thisYearZeroClockString];
    NSDate *messageTime = [dateFormatter dateFromString:time];
    NSTimeInterval secondsInOneDay = 24 * 60 * 60;
    NSDate *yesterdayZeroClock = [todayZeroClock dateByAddingTimeInterval:-secondsInOneDay];
    
    if ([todayZeroClock compare:messageTime] == NSOrderedAscending) {
        self.time.text = [time substringWithRange:NSMakeRange(10, 5)];
    } else if ([yesterdayZeroClock compare:messageTime] == NSOrderedAscending
               && [messageTime compare:todayZeroClock] == NSOrderedAscending) {
        self.time.text = @"yesterday";
    } else if ([thisYearZeroClock compare:messageTime] == NSOrderedAscending
               && [messageTime compare:yesterdayZeroClock] == NSOrderedAscending) {
        self.time.text = [time substringWithRange:NSMakeRange(5, 5)];
    } else {
        self.time.text = [time substringWithRange:NSMakeRange(0, 10)];
    }
}

- (void)freshModelWithUnreadCount:(NSInteger)unreadCount {
    if (unreadCount == 0) {
        self.unreadCount.hidden = YES;
    } else {
        self.unreadCount.hidden = NO;
        self.unreadCount.text = [[NSString alloc] initWithFormat:@"%ld",unreadCount];
    }
}

@end
