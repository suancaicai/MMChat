//
//  MMMineViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMMineViewController.h"
#import "MMUIhelp.h"
#import "MMUserDetailCell.h"
#import "MMSettingItem.h"
#import "MMUserHelp.h"

#import "MMMineDetailViewController.h"


@implementation MMMineViewController

#pragma mark - Life Cycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我"];
    [self.tableView registerClass:[MMUserDetailCell class] forCellReuseIdentifier:@"MMUserDetailCell"];

    [self initTestData];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data ? self.data.count + 1 : 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    SettingGrounp *group = [self.data objectAtIndex:section - 1];
    return group.itemsCount;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MMUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMUserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeMine];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleFill];
        return cell;
    }

    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return [super tableView:tableView heightForFooterInSection:0];
    }
    return [super tableView:tableView heightForFooterInSection:section - 1];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id vc = nil;
    if (indexPath.section == 0 && indexPath.row == 0) {     // 个人信息
        vc = [[MMMineDetailViewController alloc] init];
    }
    else {
        SettingGrounp *group = [self.data objectAtIndex:indexPath.section - 1];
        MMSettingItem *item = [group itemAtIndex: indexPath.row];
        if ([item.title isEqualToString:@"表情"]) {
//            vc = [[TLExpressionViewController alloc] init];
        }
        else if ([item.title isEqualToString:@"设置"]) {
//            vc = [[TLSettingViewController alloc] init];
        }
    }
    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Private Methods
- (void) initTestData
{
    self.data = [MMUIhelp getMineVCItems];

    _user = [MMUserHelp sharedUserHelper].user;

    [self.tableView reloadData];
}



@end
