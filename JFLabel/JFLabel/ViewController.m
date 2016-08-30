//
//  ViewController.m
//  JFLabel
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#import "ViewController.h"
#import "JFLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JFLabel *label = [[JFLabel alloc] initWithFrame:CGRectMake(100, 80, 200, 200)];
    label.text = @"我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试";
    [label addJFLabelAttribute:JFLabelAttributeColor value:[UIColor redColor] range:NSMakeRange(1, 5)];
    [label addJFLabelAttribute:JFLabelAttributeObliqueness value:@(degree(30)) range:NSMakeRange(20, 5)];
    [label addJFLabelAttribute:JFLabelAttributeDeleteLine value:[UIColor redColor] range:NSMakeRange(11, 5)];
    [label addJFLabelAttribute:JFLabelAttributeKern value:@(10) range:NSMakeRange(8, 5)];
    [label addJFLabelAttribute:JFLabelAttributeUnderLine value:[UIColor redColor] range:NSMakeRange(26, 5)];
    [label addImage:[UIImage imageNamed:@"shareds"] size:CGSizeMake(30, 30) offset:UIOffsetMake(-10, -10) location:20];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
