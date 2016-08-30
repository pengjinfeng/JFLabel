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
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试我的测试";
    [label addJFLabelAttribute:JFLabelAttributeColor value:[UIColor redColor] range:NSMakeRange(1, 5)];
    [label addJFLabelAttribute:JFLabelAttributeObliqueness value:@(degree(30)) range:NSMakeRange(20, 5)];
    [label addJFLabelAttribute:JFLabelAttributeDeleteLine value:[UIColor redColor] range:NSMakeRange(11, 5)];
    [label addJFLabelAttribute:JFLabelAttributeKern value:@(10) range:NSMakeRange(8, 5)];
    label.lineSpace = 11.0f;
    label.paragaraphSpace = 11.0f;
    label.headIndentSpace = 30.0f;
    
    [label addJFLabelAttribute:JFLabelAttributeUnderLine value:[UIColor redColor] range:NSMakeRange(1, 5)];
    [label addImage:[UIImage imageNamed:@"shareds"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, 0) location:20];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
