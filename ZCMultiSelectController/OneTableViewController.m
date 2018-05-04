//
//  OneTableViewController.m
//  ZCMultiSelectController
//
//  Created by Huang Zhicong on 2018/5/4.
//  Copyright © 2018年 hzc. All rights reserved.
//

#import "OneTableViewController.h"

@interface OneTableViewController ()

@end

@implementation OneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OneTableViewController"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"OneTableViewController"];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"这是第%ld行",(long)indexPath.row];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"这是第%ld行末尾",(long)indexPath.row];
    return cell;
}

@end
