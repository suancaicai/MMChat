//
//  MMBaseTableViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMBaseTableViewController.h"
#import "MMOptions.h"
@interface MMBaseTableViewController ()

@end

@implementation MMBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableFooterView:[UIView new]];
    [self.view setBackgroundColor:WBColor(239.0, 239.0, 244.0, 1.0)];
    [self.tableView setBackgroundColor:WBColor(239.0, 239.0, 244.0, 1.0)];

    [self setHidesBottomBarWhenPushed:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
