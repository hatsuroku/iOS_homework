//
//  ViewController.m
//  try_ios
//
//  Created by bytedance on 2020/7/10.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGRect frame = CGRectMake(0, 0, screen.size.width, 150);
    self.label = [[UILabel alloc] initWithFrame:frame];
    self.label.text = @"今日尾条";
    self.label.font = [UIFont systemFontOfSize:28];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"change" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button.frame = CGRectMake((screen.size.width - 100) / 2, 170, 100, 50);
    [self.view addSubview:self.button];
}

- (void)onClick:(id)sender {
    SecondViewController *secondVC = [SecondViewController new];
    secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:secondVC animated:YES completion:nil];
}

@end
