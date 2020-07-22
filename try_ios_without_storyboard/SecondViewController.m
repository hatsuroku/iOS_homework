//
//  SecondViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/12.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGRect frame = CGRectMake(0, 0, screen.size.width, 150);
    self.label = [[UILabel alloc] initWithFrame:frame];
    self.label.text = @"字节跳不动";
    self.label.font = [UIFont systemFontOfSize:28];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"back" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button.frame = CGRectMake((screen.size.width - 100) / 2, 170, 100, 50);
    [self.view addSubview:self.button];
    
}

- (void)onClick:(id)sender {
    SecondViewController *secondVC = [SecondViewController new];
    secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
