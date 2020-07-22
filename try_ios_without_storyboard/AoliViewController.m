//
//  AoliViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/14.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AoliViewController.h"

#ifndef ALScreenWidth
#define ALScreenWidth ([UIScreen mainScreen].bounds.size.width)
#endif

#ifndef ALScreenHeight
#define ALScreenHeight ([UIScreen mainScreen].bounds.size.height)
#endif

static const CGFloat leftMargin = 40.0f;
static const CGFloat topMargin = 30.0f;
static const CGFloat kHeaderBannerRation = 0.3253f;


@interface AoliViewController ()

@property (nonatomic, assign) CGFloat headerBannerHeight;
@property (nonatomic, assign) CGFloat welfareBannerHeight;

@end

@implementation AoliViewController


- (void)calculatePosition {
    
    self.headerBannerHeight = ALScreenWidth * kHeaderBannerRation;
    self.welfareBannerHeight = (ALScreenWidth - 2 * 20) * 0.1428f;
    
    CGRect screen = self.view.bounds;
    const CGFloat topBaseline = self.view.bounds.origin.y + 50.0f;
    
    self.headerBgColorView.frame = CGRectMake(screen.origin.x,
                                          topBaseline,
                                          screen.size.width,
                                          200);
    
    self.headerBannerView.frame = CGRectMake(screen.origin.x,
                                         topBaseline,
                                         screen.size.width,
                                         self.headerBannerHeight - 30);
    
    self.userIconView.frame = CGRectMake(screen.origin.x + leftMargin,
                                         topBaseline + topMargin,
                                     60.0f,
                                     60.0f);
    
    self.userNameLabel.frame = CGRectMake(self.userIconView.frame.origin.x + self.userIconView.frame.size.width + leftMargin,
                                          self.userIconView.frame.origin.y,
                                      300,
                                      30);
    
    self.userDescLabel.frame = CGRectMake(self.userNameLabel.frame.origin.x,
                                          self.userNameLabel.frame.origin.y + self.userNameLabel.frame.size.height + 5.0f,
                                          self.userNameLabel.frame.size.width,
                                          self.userNameLabel.frame.size.height);
    
    self.welfareBannerView.frame = CGRectMake(self.headerBannerView.frame.origin.x,
                                              self.headerBannerView.frame.origin.y + self.headerBannerView.frame.size.height + 10.0f,
                                              screen.size.width,
                                              100);
    
    self.welfareDescLabel.frame = CGRectMake(self.welfareBannerView.frame.origin.x + leftMargin,
                                             self.welfareBannerView.frame.origin.y + 35.0f,
                                             100,
                                             22);
    
    self.welfareActionLabel.frame = CGRectMake(self.welfareDescLabel.frame.origin.x + self.welfareDescLabel.frame.size.width + 170.0f,
                                               self.welfareDescLabel.frame.origin.y - 5.0f,
                                               70,
                                               35);
    
    
    
    
}

- (id)init {
    if (self = [super init]) {
        
//        UIImage *img = [UIImage imageNamed:@"avatar.png"];
//        UIImageView *imgview = [[UIImageView alloc] init];
//        [imgview setImage:img];
//
//        [self.view addSubview:imgview];
//
//        imgview.frame = self.view.frame;
        
        [self.view addSubview:self.headerBannerView];
        [self.view addSubview:self.headerBgColorView];
        [self.view addSubview:self.userIconView];
        [self.view addSubview:self.userNameLabel];
        [self.view addSubview:self.userDescLabel];
        [self.view addSubview:self.welfareBannerView];
        [self.view addSubview:self.welfareDescLabel];
        [self.view addSubview:self.welfareActionLabel];
        
        
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [self calculatePosition];
    
    
    
    
    
    CGRect screen = [[UIScreen mainScreen] bounds];
}

#pragma mark - Getter

- (UIImageView *)headerBgColorView {
    if (!_headerBgColorView) {
        _headerBgColorView = [[UIImageView alloc] init];
        _headerBgColorView.contentMode = UIViewContentModeScaleToFill;
        [_headerBgColorView setImage:[UIImage imageNamed:@"header_bg_color"]];
    }

    return _headerBgColorView;
}

- (UIImageView *)headerBannerView {
    if (!_headerBannerView) {
        _headerBannerView = [[UIImageView alloc] init];
        [_headerBannerView setImage:[UIImage imageNamed:@"header_banner"]];
    }

    return _headerBannerView;
}

- (UIImageView *)userIconView {
    if (!_userIconView) {
        _userIconView = [[UIImageView alloc] init];
        [_userIconView setImage:[UIImage imageNamed:@"avatar.png"]];
        _userIconView.layer.cornerRadius = 30.f;
        _userIconView.layer.masksToBounds = YES;
    }

    return _userIconView;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.font = [UIFont systemFontOfSize:20.f weight:UIFontWeightMedium];
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.text = @"Hatsuroku";
    }

    return _userNameLabel;
}

- (UILabel *)userDescLabel {
    if (!_userDescLabel) {
        _userDescLabel = [[UILabel alloc] init];
        _userDescLabel.font = [UIFont systemFontOfSize:14.f weight:UIFontWeightRegular];
        _userDescLabel.textColor = [UIColor grayColor];
        _userDescLabel.text = @"参与了2款内测游戏";
    }

    return _userDescLabel;
}

- (UIImageView *)welfareBannerView {
    if (!_welfareBannerView) {
        _welfareBannerView = [[UIImageView alloc] init];
        [_welfareBannerView setImage:[UIImage imageNamed:@"welfare_banner"]];
    }

    return _welfareBannerView;
}

- (UILabel *)welfareDescLabel {
    if (!_welfareDescLabel) {
        _welfareDescLabel = [[UILabel alloc] init];
        _welfareDescLabel.font = [UIFont systemFontOfSize:16.f weight:UIFontWeightMedium];
        _welfareDescLabel.textColor = [UIColor brownColor];
        _welfareDescLabel.text = @"测试奖励";
    }

    return _welfareDescLabel;
}

- (UILabel *)welfareActionLabel {
    if (!_welfareActionLabel) {
        _welfareActionLabel = [[UILabel alloc] init];
        _welfareActionLabel.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.7];
        _welfareActionLabel.font = [UIFont systemFontOfSize:14.f weight:UIFontWeightMedium];
        _welfareActionLabel.textColor = [UIColor colorWithRed:119.0f/255.0f green:48.0f/255.0f blue:0.0f alpha:1.0f];
        _welfareActionLabel.text = @"查看";
        _welfareActionLabel.textAlignment = NSTextAlignmentCenter;
        _welfareActionLabel.layer.cornerRadius = 12.f;
        _welfareActionLabel.layer.masksToBounds = YES;
        _welfareActionLabel.userInteractionEnabled = YES;
    }

    return _welfareActionLabel;
}

@end
