//
//  HWViewController.m
//  try_ios_without_storyboard
//
//  Created by bytedance on 2020/7/12.
//  Copyright © 2020 Kazami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chapter4ViewController.h"

@interface Chapter4ViewController () <UITextFieldDelegate, UITextViewDelegate, WKNavigationDelegate>

#pragma mark -- 菊花和进度条
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) NSTimer *timer;
@end


@implementation Chapter4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen =[[UIScreen mainScreen] bounds];
    
#pragma mark -- 导航栏
    
//    CGFloat navigationBarHeight = 44;
//
//    /// 1. 创建NavigationBar
//    UINavigationBar *navigationBar = [ [UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, screen.size.width, navigationBarHeight)];
//    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
//    UIBarButtonItem *addButtonItem =[ [UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
//    UINavigationItem *navigationItem = [[UINavigationItem alloc ] initWithTitle:@""];
//    navigationItem.leftBarButtonItem = saveButtonItem;
//    navigationItem.rightBarButtonItem = addButtonItem;
//    navigationBar.items = @[navigationItem];
//    [self.view addSubview:navigationBar];
//
//
//    /// 2.添加标签
//    CGFloat labelWidth = 84;
//    CGFloat labelHeight = 21;
//    CGFloat labelTopView = 198;
//    self.label = [[UILabel alloc] initWithFrame :CGRectMake((screen. size.width -
//    - labelWidth)/2 , labelTopView, labelWidth, labelHeight)];
//    self.label.text = @"Label";
//    // 左右字体居中
//    self.label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.label];
    
#pragma mark -- 工具栏
//    CGFloat toolbarHeight = 44; //44是默认高度
//    UIToolbar* toolbar = [[UIToolbar alloc ] initWithFrame :CGRectMake(0,
//    screen.size.height - toolbarHeight, screen.size.width, toolbarHeight)];
//    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
//    UIBarButtonItem *openButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain
//    target:self action:@selector(open:)];
//
//    UIBarButtonItem *flexibleButtonItem = [ [UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    toolbar.items = @[ saveButtonItem, flexibleButtonItem, openButtonItem];
//    [self.view addSubview:toolbar];
//    CGFloat labelWidth = 84;
//    CGFloat labelHeight = 21;
//    CGFloat labelTopView = 250;
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen. size.width - labelWidth)/2 , labelTopView, labelWidth, labelHeight)];
//
//    self.label.text = @"Label";
//    //字体左右居中
//    self. label. textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.label];
    
#pragma mark -- 进度条
//    ///3.进度条
//    CGFloat progressViewWidth = 200;
//    CGFloat progressViewHeight = 2;
//    CGFloat progressViewTopView = 283;
//    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - progressViewWidth)/2, progressViewTopView, progressViewWidth, progressViewHeight)];
//    [self.view addSubview: self.progressView];
//
//    ///4.Download按钮
//    UIButton* buttonDownload = [UIButton buttonWithType:UIButtonTypeSystem];
//    [buttonDownload setTitle:@"Download" forState:UIControlStateNormal];
//    CGFloat buttonDownloadWidth = 69;
//    CGFloat buttonDownloadHeight = 30;
//    CGFloat buttonDownloadTopView = 384;
//    buttonDownload.frame = CGRectMake((screen.size.width - buttonDownloadWidth)/2, buttonDownloadTopView, buttonDownloadWidth, buttonDownloadHeight);
//    //指定事件处理方法
//    [buttonDownload addTarget:self action:@selector(downloadProgress:)
//    forControlEvents: UIControlEventTouchUpInside];
//    [self.view addSubview:buttonDownload];
    
#pragma mark -- 转菊花
//    self.view.backgroundColor = [UIColor whiteColor];
//    ///1.获得指示器
//    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
//    CGRect frame = self.activityIndicatorView.frame;
//    frame.origin = CGPointMake((screen.size.width - frame.size.width) / 2, 84);
//    //重新设置控件的位置
//    self.activityIndicatorView.frame = frame;
//    self.activityIndicatorView.hidesWhenStopped = false;
//    [self.view addSubview:self.activityIndicatorView];
//
//    ///2.Upload按钮
//    UIButton* buttonUpload = [UIButton buttonWithType:UIButtonTypeSystem];
//    [buttonUpload setTitle:@"Upload" forState:UIControlStateNormal];
//    CGFloat buttonUploadWidth = 50;
//    CGFloat buttonUploadHeight = 30;
//    CGFloat buttonUploadTopView = 190;
//    buttonUpload.frame = CGRectMake((screen. size.width - buttonUploadWidth)/2 , buttonUploadTopView, buttonUploadWidth, buttonUploadHeight);
//    //指定事件处理方法
//    [buttonUpload addTarget:self action:@selector(startToMove:) forControlEvents :UIControlEventTouchUpInside];
//    [self.view addSubview:buttonUpload];
    
    
#pragma mark -- 警告框
//    CGRect screen = [[UIScreen mainScreen] bounds];
//    UIButton* buttonAlertView = [UIButton buttonWithType:UIButtonTypeSystem];
//    [buttonAlertView setTitle:@"Test警告框" forState:UIControlStateNormal];
//    CGFloat buttonAlertViewWidth = 100;
//    CGFloat buttonAlertViewHeight = 30;
//    CGFloat buttonAlertViewTopView = 130;
//    buttonAlertView.frame = CGRectMake((screen.size.width - buttonAlertViewWidth)/2 , buttonAlertViewTopView, buttonAlertViewWidth, buttonAlertViewHeight);
//    //指定事件处理方法
//    [buttonAlertView addTarget:self action:@selector(testAlertView:) forControlEvents: UIControlEventTouchUpInside];
//    [self.view addSubview:buttonAlertView];
//
//    UIButton* buttonActionSheet = [UIButton buttonWithType:UIButtonTypeSystem];
//    [buttonActionSheet setTitle:@"Test操作表" forState:UIControlStateNormal];
//    CGFloat buttonActionSheetWidth = 100;
//    CGFloat buttonActionSheetHeight = 30;
//    CGFloat buttonActionSheetTopView = 260;
//    buttonActionSheet. frame = CGRectMake((screen.size.width - buttonActionSheetWidth) /2 , buttonActionSheetTopView, buttonActionSheetWidth, buttonActionSheetHeight);
//    //指定事件处理方法
//    [buttonActionSheet addTarget:self action:@selector(testActionSheet:) forControlEvents: UIControlEventTouchUpInside];
//    [self.view addSubview:buttonActionSheet];
    
    
#pragma mark -- WKWebView
    
//    CGRect screen = [[UIScreen mainScreen] bounds ];
//    // 按钮栏
//    // 按钮栏宽
//    CGFloat buttonBarWidth = 316;
//    UIView* buttonBar = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - buttonBarWidth) / 2, 20, buttonBarWidth, 30)];
//    [self.view addSubview:buttonBar];
//
//
//    // 1.添加LoadHTMLStringt按钮
//    UIButton* buttonLoadHTMLString = [UIButton buttonWithType:UIButtonTypeSystem];
//    [buttonLoadHTMLString setTitle:@"LoadHTMLString" forState:UIControlStateNormal];
//    buttonLoadHTMLString.frame = CGRectMake(0, 0, 117, 30);
//    // 指定事件处理方法
//    [buttonLoadHTMLString addTarget:self action:@selector(testLoadHTMLString:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonBar addSubview:buttonLoadHTMLString];
//
//    // 2.添加LoadData按钮
//    UIButton* buttonLoadData = [UIButton buttonWithType :UIButtonTypeSystem];
//    [buttonLoadData setTitle:@"LoadData" forState:UIControlStateNormal];
//    buttonLoadData. frame = CGRectMake(137, 0, 67, 30);
//    // 指定事件处理方法
//    [buttonLoadData addTarget:self action:@selector(testLoadData:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonBar addSubview: buttonLoadData];
//
//    /// 3.添加LoadRequest按钮
//    UIButton* buttonLoadRequest = [UIButton buttonWithType:UIButtonTypeSystem];
//    [buttonLoadRequest setTitle:@"LoadRequest" forState:UIControlStateNormal];
//    buttonLoadRequest. frame = CGRectMake(224, 0, 92, 30);
//    // 指定事件处理方法
//    [buttonLoadRequest addTarget:self action:@selector(testLoadRequest:)forControlEvents: UIControlEventTouchUpInside];
//    [buttonBar addSubview: buttonLoadRequest];
//    /// 4.添加WKWebView
//    self.webView = [[WKWebView alloc] initWithFrame: CGRectMake(0, 60,screen.size.width, screen.size.height - 80)];
//    [self.view addSubview:self.webView];
    
    
#pragma mark -- 按钮，选项和滑条
    
//    CGRect screen = [[UIScreen mainScreen] bounds];
//
//    //1. 添加rightSwitch控件
//    //nightSwitch与屏幕的左边距
//    //leftSwitch与屏幕的右边距
//    CGFloat switchScreenSpace = 39;
//
//
//    self.rightSwitch = [[UISwitch alloc] init];
//    CGRect frame = self.rightSwitch.frame;
//    frame.origin = CGPointMake(switchScreenSpace, 98);
//    //重新设置控件的位置
//    self.rightSwitch.frame = frame;
//    //设置控件状态
//    self.rightSwitch.on = TRUE;
//    // 指定事件处理方法
//    [self.rightSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.rightSwitch];
//
//    // 2.添加leftSwitch控件
//    self.leftSwitch = [[UISwitch alloc] init];
//    frame = self.leftSwitch.frame;
//    frame.origin = CGPointMake(screen.size.width - (frame.size.width +
//    switchScreenSpace), 98);
//    //重新设置控件的位置
//    self.leftSwitch.frame = frame;
//    //设置控件状态
//    self.leftSwitch.on = TRUE;
//    //指定事件处理方法
//    [self.leftSwitch addTarget:self action:@selector(switchValueChanged:)
//    forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.leftSwitch];
//
//
//    //3.添加segmentedControl控件
//    NSArray* segments = @[@"One", @"Two", @"Three"];
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems :segments];
//    CGFloat scWidth = 220;
//    CGFloat scHeight = 29; //29为默认高度
//    CGFloat scTopView = 186;
//    frame = CGRectMake((screen. size.width - scWidth)/2, scTopView, scWidth, scHeight);
//    //重新设置控件的位置
//    segmentedControl.frame = frame;
//    //指定事件处理方法
//    [segmentedControl addTarget:self action:@selector(touchDown:) forControlEvents :UIControlEventValueChanged];
//    [self.view addSubview:segmentedControl];
//
//    ///4.添加slider控件
//    CGFloat sliderWidth = 300;
//    CGFloat sliderHeight = 31; //31为默认高度
//    CGFloat sliderdTopView = 298;
//    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((screen.size.width- sliderWidth)/2, sliderdTopView, sliderWidth, sliderHeight)];
//    slider.minimumValue = 0.0f;
//    slider.maximumValue = 100.0f;
//    slider.value = 50.00f;
//    //指定事件处理方法
//    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:slider];
//
//
//    /// 5.添加SliderValue:标签
//    // SliderValue:标签与Slider之间的距离
//    CGFloat labelSliderValueSliderSpace = 30;
//    UILabel* labelSliderValue = [[UILabel alloc] initWithFrame:CGRectMake(slider. frame.origin.x, slider.frame.origin.y - labelSliderValueSliderSpace, 103, 21)];
//    labelSliderValue.text = @"SliderValue: ";
//    [self.view addSubview:labelSliderValue];
//
//
//    ///6.添加sliderValue标签
//    self.sliderValue = [[UILabel alloc] initWithFrame:CGRectMake(labelSliderValue. frame.origin.x + 120, labelSliderValue. frame.origin.y, 50, 21)];
//    self.sliderValue.text = @"50" ;
//    [self.view addSubview:self.sliderValue];
    
#pragma mark -- textView和textField

//    CGRect screen = [[UIScreen mainScreen] bounds];
//    CGFloat textFieldWidth = 223;
//    CGFloat textFieldHeight = 30;
//    CGFloat textFieldTopView = 150;
//    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth)/2, textFieldTopView, textFieldWidth, textFieldHeight)];
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.delegate = self;
//    [self.view addSubview:textField];
//
//    CGFloat labelNameTextFieldSpace = 30;
//    UILabel * labelName = [[UILabel alloc] initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y - labelNameTextFieldSpace, 51, 21)];
//    labelName.text = @"Name";
//    [self.view addSubview:labelName];
//
//    CGFloat textViewWidth = 236;
//    CGFloat textViewHeight = 198;
//    CGFloat textViewTopView = 240;
//    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake((screen.size.width - textViewWidth) / 2, textViewTopView, textViewWidth, textViewHeight)];
//
//    textView.text = @"Lorem ipsum dolor sit er elit lamet, ...";
//
//    textView.delegate = self;
//    [self.view addSubview:textView];
//
//    CGFloat labelAbstractTextViewSpace = 30;
//    UILabel * labelAbstract = [[UILabel alloc] initWithFrame:CGRectMake(textView.frame.origin.x, textView.frame.origin.y - labelAbstractTextViewSpace, 103, 21)];
//    labelAbstract.text = @"Abstract";
//    [self.view addSubview:labelAbstract];
    
    
#pragma mark -- label和button
    
// 搞一个框
//    CGFloat labelWidth = 90;
//    CGFloat labelHeight = 20;
//    CGFloat labelTopView = 150;
//    CGRect labelFrame = CGRectMake((screen.size.width - labelWidth) / 2, labelTopView, labelWidth, labelHeight);
//
//    // 指定在这个框里面画label
//    self.label = [[UILabel alloc] initWithFrame:labelFrame];
//
//    self.label.text = @"今日吃屎";
//    // 调整对其方式
//    self.label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.label];
//
//    // 创建button的同时指定样式
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
//    // 指定button在什么状态时应该显示什么文本
//    [button setTitle:@"OK" forState:UIControlStateNormal];
//
//    CGFloat buttonWidth = 60;
//    CGFloat buttonHeight = 20;
//    CGFloat buttonTopView = 240;
//
//    button.frame = CGRectMake((screen.size.width - buttonWidth) / 2, buttonTopView, buttonWidth, buttonHeight);
//
//    // 增加时间监听器
//    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
//
//    // 别忘记加到主view中
//    [self.view addSubview:button];
    
    
}

//- (void)onClick:(id)sender {
//    self.label.text = @"吃了";
//}

#pragma mark -- 导航栏
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)add:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message: @"点击了add按钮" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Tap add Button");
    }];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:true completion: nil];
}

#pragma mark -- 工具栏
- (void)save:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message: @"点击了save按钮" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Tap save Button");
    }];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:true completion: nil];
}

- (void)open:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message: @"点击了open按钮" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Tap open Button");
    }];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:true completion: nil];
}

#pragma mark -- 进度条
- (void)downloadProgress:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:TRUE];
}

-(void)download {
    self.progressView.progress = self.progressView.progress + 0.1;
    if (self.progressView.progress == 1.0) {
        [self.timer invalidate];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"download completed!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:okAction];
        
        // 显示
        [self presentViewController:alertController animated:true completion:nil];
    }
}

#pragma mark -- 转菊花
- (void)startToMove:(id)sender {
    if ([self.activityIndicatorView isAnimating]) {
        [self.activityIndicatorView stopAnimating];
    } else {
        [self.activityIndicatorView startAnimating];
    }
}

#pragma mark -- 警告
- (void)testAlertView: (id)sender {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Alert" message: @"Alert text goes here" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"Don't touch!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"Tap No Button");
    }];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Tap Yes Button");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];

    // 显示
    [self presentViewController:alertController animated:true completion: nil];
}

- (void)testActionSheet: (id)sender {
    UIAlertController* actionSheetController = [[UIAlertController alloc] init];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    NSLog(@"Tap 取消 Button");
    }];
    UIAlertAction* destructiveAction = [UIAlertAction actionWithTitle:@"破坏性按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
    NSLog(@"Tap破坏性按钮Button");
    }];
    UIAlertAction* otherAction = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    NSLog(@"Tap 新浪微博 Button");
    }];
    
    UIAlertAction* otherAction1 = [UIAlertAction actionWithTitle:@"A1" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    NSLog(@"Tap A1 Button");
    }];
    UIAlertAction* otherAction2 = [UIAlertAction actionWithTitle:@"A2" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    NSLog(@"Tap A2 Button");
    }];
    UIAlertAction* otherAction3 = [UIAlertAction actionWithTitle:@"A3" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    NSLog(@"Tap A3 Button");
    }];
    
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:destructiveAction];

    [actionSheetController addAction:otherAction2];
    [actionSheetController addAction:otherAction1];
    [actionSheetController addAction:otherAction3];
    [actionSheetController addAction:otherAction];
    
    // 为iPad设备浮动层设置锚点
    actionSheetController.popoverPresentationController.sourceView = sender;
    // 显示
    [self presentViewController:actionSheetController animated:true completion:nil];
}

#pragma mark -- WKWebView
- (void)testLoadHTMLString:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error = nil;
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    if (error == nil) {//数据加载没有错误的情况下
        [self.webView loadHTMLString:html baseURL:bundleUrl];
    }
}
- (void)testLoadData:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSData *htmlData = [[NSData alloc] initWithContentsOfFile: htmlPath];
    [self.webView loadData:htmlData MIMEType :@"text/html"
    characterEncodingName:@"UTF-8" baseURL:bundleUrl];
}
- (void)testLoadRequest:(id)sender {
    NSURL * url = [NSURL URLWithString: @"https://www.google.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest :request];
    self.webView.navigationDelegate = self;
}

#pragma mark -- 实现wKNavigationDelegate委托协议
//开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation: (WKNavigation *)navigation {
    NSLog(@"开始加载");
}
//当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"内容开始返回");
}
//加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
}
//加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation: (WKNavigation *)navigation withError: (NSError *)error {
    NSLog(@"加载失败error : %@", error.description);
}

#pragma mark -- 开关、选项和滑条

// 使两个开关的值保持一致
- (void)switchValueChanged: (id)sender {
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}

// 点击分段控件，控制开关控件的隐藏或显示
- (void)touchDown: (id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"选择的段: %li", segmentedControl.selectedSegmentIndex);
    if (self.leftSwitch.hidden) {
        self.rightSwitch.hidden = FALSE;
        self.leftSwitch.hidden = FALSE;
    } else {
        self.leftSwitch.hidden = TRUE;
        self.rightSwitch.hidden = TRUE;
    }
}

// 用标签显示滑块的值
- (void)sliderValueChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d" ,progressAsInt];
    NSLog(@"滑块的值: %@", newText);
    self.sliderValue.text = newText;
}

#pragma mark -- implement UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"TextField get focused, click the return button");
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- implement UITextViewDelegate methods
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        NSLog(@"TextView get focused, click the return button");
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardDidShow:(NSNotification *)notification {
    NSLog(@"keyboard showed");
}

- (void)keyboardDidHide:(NSNotification *)notification {
    NSLog(@"keyboard hid");
}

@end
