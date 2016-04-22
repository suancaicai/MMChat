//
//  MMMineDetailViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMMineDetailViewController.h"
#import "MMUIhelp.h"
#import "MMMyCodeViewController.h"
@interface MMMineDetailViewController ()

@end
@implementation MMMineDetailViewController
#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人信息"];
    self.data = [MMUIhelp getMineDetailVCItems];
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id vc = nil;
    if (indexPath.section == 0 && indexPath.row == 0) {     // 个人信息
//        vc = [[MMMineDetailViewController alloc] init];
    }
    else {
        SettingGrounp *group = [self.data objectAtIndex:indexPath.section];
        MMSettingItem *item = [group itemAtIndex: indexPath.row];
        if ([item.title isEqualToString:@"我的二维码"]) {
            vc = [[MMMyCodeViewController alloc] init];
        }
//        else if ([item.title isEqualToString:@"设置"]) {
//            //            vc = [[TLSettingViewController alloc] init];
//        }
    }
    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];

}

@end

