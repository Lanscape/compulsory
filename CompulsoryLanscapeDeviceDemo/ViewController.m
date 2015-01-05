//
//  ViewController.m
//  CompulsoryLanscapeDeviceDemo
//
//  Created by gdcn on 15-1-5.
//  Copyright (c) 2015年 cndatacom. All rights reserved.
//

#import "ViewController.h"
#import "LanscapeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    pushBtn.frame = CGRectMake((self.view.frame.size.width - 100)/2, (self.view.frame.size.height - 20 - 35)/2, 100, 35);
    [pushBtn setTitle:@"推出横屏" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushLanscapeVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

-(void)pushLanscapeVC:(UIButton *)sender{
    LanscapeViewController *lanscapeVC = [[LanscapeViewController alloc]init];
    [self presentViewController:lanscapeVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
