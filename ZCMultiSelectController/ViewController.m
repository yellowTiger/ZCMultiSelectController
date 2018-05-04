//
//  ViewController.m
//  ZCMultiSelectController
//
//  Created by Huang Zhicong on 2018/5/4.
//  Copyright © 2018年 hzc. All rights reserved.
//

#import "ViewController.h"
#import "OneTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //button 的title
    NSArray *titleArr=@[@"First",@"Second",@"Three",@"Four",@"Five"];
    
    //对应的子控制器
    NSMutableArray* controllerArr = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        [controllerArr addObject:[[OneTableViewController alloc]init]];
    }
    
    [self setUp:titleArr controllerArr:controllerArr];
    //设置顶部按钮和下划线颜色
//    [self setTopViewColor:[UIColor grayColor] selectedColor:[UIColor orangeColor]];
    
    self.navigationItem.title=@"Test";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
