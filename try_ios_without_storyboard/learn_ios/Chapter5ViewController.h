//
//  Chapter5ViewController.h
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/16.
//  Copyright © 2020 Kazami. All rights reserved.
//

#ifndef Chapter5ViewController_h
#define Chapter5ViewController_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Chapter5ViewController : UIViewController

@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) NSDictionary *pickerData;     // 保存全部数据
@property (strong, nonatomic) NSArray *pickerProvinceData; // 当前的省数据
@property (strong, nonatomic) NSArray *pickerCitiesData; // 当前省下面的市数据
@property (strong, nonatomic) UIPickerView *pickerView;

@property (strong, nonatomic) UIImageView *imageView;

@end


@interface EventCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *label;

@end


#endif /* Chapter5ViewController_h */
