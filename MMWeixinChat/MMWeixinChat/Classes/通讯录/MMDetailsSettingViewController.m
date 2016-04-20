//
//  MMDetailsSettingViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMDetailsSettingViewController.h"
#import "MMUIhelp.h"

@implementation MMDetailsSettingViewController
#pragma mark - LifeCycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"资料设置"];

    self.data = [MMUIhelp getDetailSettingVCItems];
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end


