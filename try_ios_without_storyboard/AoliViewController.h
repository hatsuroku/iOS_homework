//
//  AoliViewController.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/14.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef AoliViewController_h
#define AoliViewController_h

#import <UIKit/UIKit.h>

@interface AoliViewController : UIViewController

@property (strong, nonatomic) UIImageView *headerBgColorView;
@property (strong, nonatomic) UIImageView *headerBannerView;

@property (strong, nonatomic) UIImageView *userIconView;
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UILabel *userDescLabel;

@property (strong, nonatomic) UIImageView *welfareBannerView;
@property (strong, nonatomic) UILabel *welfareDescLabel;
@property (strong, nonatomic) UILabel *welfareActionLabel;

@end


#endif /* AoliViewController_h */
