//
//  HWViewController.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/12.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef HWViewController_h
#define HWViewController_h

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface Chapter4ViewController : UIViewController
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UISwitch *rightSwitch;
@property (strong, nonatomic) UISwitch *leftSwitch;
@property (strong, nonatomic) UILabel *sliderValue;
@property (strong, nonatomic) WKWebView *webView;
@end


#endif /* HWViewController_h */
