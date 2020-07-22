//
//  FirstViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/12.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGRect frame = CGRectMake(0, 0, screen.size.width, screen.size.height / 2);
    self.label = [[UILabel alloc] initWithFrame:frame];
    self.label.text = @"今日尾条";
    self.label.font = [UIFont systemFontOfSize:28];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"change" forState:UIControlStateNormal];
    [self.button setTitle:@"摸我干啥" forState:UIControlStateHighlighted];
    [self.button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button.frame = CGRectMake((screen.size.width - 100) / 2, screen.size.height / 2 + 100, 100, 50);
    [self.view addSubview:self.button];
}

- (void)onClick:(id)sender {
    SecondViewController *secondVC = [SecondViewController new];
    secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:secondVC animated:YES completion:nil];
}

@end
