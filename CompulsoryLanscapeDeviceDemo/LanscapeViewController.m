//
//  LanscapeViewController.m
//  CompulsoryLanscapeDeviceDemo
//
//  Created by gdcn on 15-1-5.
//  Copyright (c) 2015年 cndatacom. All rights reserved.
//

#import "LanscapeViewController.h"

@interface LanscapeViewController ()

@end

@implementation LanscapeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    
    CGFloat top = 0.0f;
    CGFloat hh = 0.0f;
    self.view.backgroundColor = [UIColor whiteColor];
    if (IOS7_OR_LATER) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        top = 20;
    }else{
        hh = 20.0f;
    }
    
    
    
    UIView *navView = [[UIView alloc] init] ;
    navView.frame = CGRectMake(0, top, self.view.frame.size.width, 44);
    navView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIImageView *imgeView = [[UIImageView alloc] init];
    imgeView.frame = CGRectMake(0, 0, navView.frame.size.width, navView.frame.size.height);
    UIImage * navBgImg = [UIImage imageNamed:@"bgtitle.png"];
    UIImage *imgg =[navBgImg resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, navBgImg.size.height , navBgImg.size.width)];
    imgeView.image  = imgg;
    
    [navView addSubview:imgeView];
    [self.view addSubview:navView];
    
    
    CGRect rect = CGRectMake((self.view.bounds.size.width - 200)/2, 0, 200, 44);
    UILabel *_titleLabel = [[UILabel alloc] initWithFrame:rect];
    _titleLabel.backgroundColor = [UIColor clearColor];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"强制横屏";
    [navView addSubview:_titleLabel];
    
    
    UIButton *leftBackBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBackBtn.frame = CGRectMake(10, (44 - 35) / 2.0, 35, 35);
    [leftBackBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBackBtn addTarget:self action:@selector(backToFather) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBackBtn];
    top += navView.frame.size.height;
    
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, top, self.view.frame.size.width, self.view.frame.size.height - top - hh)];
    contentView.clipsToBounds = YES;
    [contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green.png"]]];
    [self.view addSubview:contentView];
}
-(void)viewWillAppear:(BOOL)animated{
    //设置状态栏
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft animated:NO];
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    //设置旋转动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    //设置导航栏旋转
    self.navigationController.navigationBar.frame = CGRectMake(-204,224, [[UIScreen mainScreen] bounds].size.height, 32);
    self.navigationController.navigationBar.transform = CGAffineTransformMakeRotation(M_PI*1.5);
    //设置视图旋转
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.view.transform = CGAffineTransformMakeRotation(M_PI*1.5);
    [UIView commitAnimations];
    //必须重新设置bounds属性
    if (IOS7_OR_LATER) {
        self.view.bounds = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }else{
        self.view.bounds = CGRectMake(-20, -20, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }
}
#pragma mark -- 返回
- (void)backToFather
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -- 支持状态栏旋转
-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
