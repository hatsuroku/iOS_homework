//
//  Chapter5ViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/16.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import "Chapter5ViewController.h"

//#pragma mark -- 普通选择器
//@interface Chapter5ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
//@end

#pragma mark -- 集合视图
const NSInteger colNum = 3;
@interface Chapter5ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation EventCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 单元格的宽度
        CGFloat cellWidth = self.frame.size.width;
        CGFloat imageViewWidth = 101;
        CGFloat imageViewHeight = 101;
        CGFloat imageViewTopView = 15;
        ///1.添加ImageView
        self.imageView = [[UIImageView alloc ] initWithFrame: CGRectMake((cellWidth - imageViewWidth) / 2, imageViewTopView, imageViewWidth, imageViewHeight)];
        [self addSubview:self.imageView];
        
        ///2.添加标签
        CGFloat labelWidth = 101;
        CGFloat labelHeight = 16;
        CGFloat labelTopView = 120;
        self.label = [ [UILabel alloc ] initWithFrame:CGRectMake((cellWidth - labelWidth) / 2, labelTopView, labelWidth, labelHeight)];
        //字体左右居中
        self. label. textAlignment = NSTextAlignmentCenter;
        // 设置字体
        self.label.font = [UIFont systemFontOfSize:13];
        [self addSubview:self. label];
    }
    return self;
}

@end


@implementation Chapter5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
#pragma mark -- 集合视图
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.events = [[NSArray alloc] initWithContentsOfFile:plistPath];
    [self setupCollectionView];
    
    
#pragma mark -- 普通选择器
    
/*
 * 总结：
 * UIPickerViewDataSource委托：提供选择器的列数和每列的行数
 * UIPickerViewDelegate委托：提供显示数据，以及决定选中选择器的某个拨轮时的动作
 * 选择器只返回index，和显示的数据解耦。
 */
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinces_cities" ofType:@"plist"];
//
//    // 获取属性列表文件中的全部数据
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    self.pickerData = dict;
//
//    // 省份名数据
//    self.pickerProvinceData = [self.pickerData allKeys];
//
//    // 默认取出第一个省的所有市的数据
//    NSString *selectedProvince = self.pickerProvinceData[0];
//    self.pickerCitiesData = self.pickerData[selectedProvince];
//
//    /// 1.选择器
//    CGFloat pickerViewidth = 320;
//    CGFloat pickerViewHeight = 162;
//    self. pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, pickerViewidth, pickerViewHeight)];
//    [self.view addSubview:self.pickerView];
//    self.pickerView.dataSource = self;
//    self.pickerView.delegate = self;
//
//    /// 2.添加标签
//    CGFloat labelWidth = 200;
//    CGFloat labelHeight = 21;
//    CGFloat labelTopView = 273;
//    self. label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2 , labelTopView, labelWidth, labelHeight)];
//    self.label.text = @"Label";
//    //字体左右居中
//    self. label. textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self. label];
//
//    /// 3.Button按钮
//    UIButton* button= [UIButton buttonWithType :UIButtonTypeSystem];
//    [button setTitle:@"Button" forState:UIControlStateNormal];
//    CGFloat buttonWidth = 46;
//    CGFloat buttonHeight = 30;
//    CGFloat buttonTopView = 374;
//    button. frame = CGRectMake((screen. size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
//    // 指定事件处理方法
//    [button addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    
#pragma mark -- 日期选择器
//    ///1.日期选择器
//    CGFloat datePickerWidth = 320;
//    CGFloat datePickerHeight = 167;
//    self.datePicker = [ [UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, datePickerWidth, datePickerHeight)];
//    //zh-Hans简体中文
//    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
//    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
//    [self.view addSubview:self.datePicker];
//
//    ///2.添加标签
//    CGFloat labelWidth = 200;
//    CGFloat labelHeight = 21;
//    CGFloat labelTopView = 281;
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width- labelWidth)/2, labelTopView, labelWidth, labelHeight)];
//    self.label.text = @"Label";
//    //字体左右居中
//    self.label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.label];
//
//    ///3.Button按钮
//    UIButton* button= [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"Button" forState:UIControlStateNormal];
//    CGFloat buttonWidth = 46;
//    CGFloat buttonHeight = 30;
//    CGFloat buttonTopView = 379;
//    button. frame = CGRectMake((screen.size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
//    //指定事件处理方法
//    [button addTarget:self action:@selector(onclick:) forControlEvents:
//    UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    
}

#pragma mark -- 集合视图
- (void) setupCollectionView {
    //1.创建流式布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //2.设置每个单元格的尺寸
    layout.itemSize = CGSizeMake(80, 80);
    //3.设置整个collectionView的内边距
    layout.sectionInset = UIEdgeInsetsMake(30, 15, 50, 15);
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    // 重新设置 iPhone 6/6s/7/7s/Plus
    if (screenSize.height > 568) {
        layout.itemSize = CGSizeMake(100, 100);
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 40, 15);
    }
    //4.设置单元格之间的间距
    layout.minimumInteritemSpacing = 10;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    //设置可重用单元格标识与单元格类型
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier :@"cellIdentifier" ];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.view addSubview:self.collectionView];
}


/// 数据源（UICollectionViewDataSource）协议

// 提供视图中节的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    int num = [self.events count] % colNum;
    if (num == 0) {
        return [self.events count] / colNum;
    } else {
        return [self.events count] / colNum + 1;
    }
}

// 提供某个节中的列数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return colNum;
}

// 为单元格提供显示数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    // 计算events集合下标索引
    NSInteger idx = indexPath.section * colNum + indexPath.row;
    if (self.events.count <= idx) {
        return cell;
    }
    
    NSArray *event = self.events;
    
    cell.label.text = event[idx];
    cell.imageView.image = [UIImage imageNamed:@"avatar.png"];
    
    return cell;
}


///实现委托协议UICollectionViewDelegate

// 选择单元格之后触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *event = self.events[indexPath.section * colNum + indexPath.row];
    NSLog(@"select event name : %@", event);
}

//


#pragma mark -- 普通选择器
//- (void)onclick:(id)sender {
//    // 选择器只返回index，不返回具体数据
//    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
//    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
//
//    NSString *selected1 = self.pickerProvinceData[row1];
//    NSString *selected2 = self.pickerCitiesData[row2];
//
//    NSString *title = [[NSString alloc] initWithFormat:@"%@, %@", selected1 ,selected2];
//
//    self.label.text = title;
//}
//
///*
// * UIPickerViewDataSource协议
// * 拨轮的数目
// */
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return 2;
//}
//
///*
// * UIPickerViewDataSource协议
// * @param component: 拨轮的序号，从0开始算
// * @return 拨轮项目的行数
// */
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    if (component == 0) {
//        // 省份个数
//        return [self.pickerProvinceData count];
//    } else {
//        // 市的个数
//        return [self.pickerCitiesData count];
//    }
//}
//
//
///*
// * UIPikcerViewDelegate协议
// * 为选择器中某个拨轮的行提供显示数据
// * @param row: 行数
// * @param component: 拨轮的序号
// */
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    if (component == 0) {
//        // 选择省份名
//        return self.pickerProvinceData[row];
//    } else {
//        // 选择市名
//        return self.pickerCitiesData[row];
//    }
//}
//
///*
// * UIPickerViewDelegate协议
// * 选中选择器的某个拨轮中的某行时调用
// * @param row: 行数
// * @param component: 拨轮的序号
// */
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    if (component == 0) {
//        NSString *selectedProvince = [self.pickerProvinceData objectAtIndex:row];
//        NSArray *array = [self.pickerData objectForKey:selectedProvince];
//        self.pickerCitiesData = array;
//        [self.pickerView reloadComponent:1];
//    }
//}

#pragma mark -- 日期选择器
//- (void)onclick:(id)sender {
//    NSDate *theDate = self.datePicker.date;
//    NSLog(@"the date picked is: %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
//    NSLog(@"the date formate is: %@", [dateFormatter stringFromDate:theDate]);
//    self.label.text = [dateFormatter stringFromDate:theDate];
//}

@end
