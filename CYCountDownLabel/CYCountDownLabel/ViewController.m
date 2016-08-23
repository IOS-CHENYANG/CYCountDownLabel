//
//  ViewController.m
//  CYCountDownLabel
//
//  Created by 陈阳阳 on 16/8/23.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import "ViewController.h"
#import "CYCountDownLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CYCountDownLabel *label = [[CYCountDownLabel alloc]initWithFrame:CGRectMake(100, 300, 80, 40) textColor:[UIColor redColor] backgroundColor:[UIColor grayColor] font:[UIFont systemFontOfSize:15.0f]];
    label.second = 3;
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
