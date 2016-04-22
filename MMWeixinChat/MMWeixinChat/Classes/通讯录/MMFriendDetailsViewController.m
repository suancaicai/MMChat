//
//  MMFriendDetailsViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMFriendDetailsViewController.h"
#import "MMDetailsSettingViewController.h"
#import "MMUserDetailCell.h"
#import "MMDetailsSettingViewController.h"
#import "MMUIhelp.h"

@interface MMFriendDetailsViewController ()

@property (nonatomic, strong) MMDetailsSettingViewController *detailSettingVC;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@end


@implementation MMFriendDetailsViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"详细资料"];
    [self.tableView registerClass:[MMUserDetailCell class] forCellReuseIdentifier:@"MMUserDetailCell"];
    [self initTestData];
    [self.navigationItem setRightBarButtonItem:self.rightBarButtonItem];

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
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
        [cell setCellType:UserDetailCellTypeFriends];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
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
    if (indexPath.section == 0) {
    }
    else {

    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Event Response
- (void) rightBarButtonDown
{
    [self.navigationController pushViewController:self.detailSettingVC animated:YES];
}

#pragma mark - Private Methods
- (void) initTestData
{
    self.data = [MMUIhelp getDetailVCItems];

    [self.tableView reloadData];
}

#pragma mark - Getter and Setter
- (MMDetailsSettingViewController *) detailSettingVC
{
    if (_detailSettingVC == nil) {
        _detailSettingVC = [[MMDetailsSettingViewController alloc] init];
    }
    return _detailSettingVC;
}

- (UIBarButtonItem *) rightBarButtonItem
{
    if (_rightBarButtonItem == nil) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    }
    return _rightBarButtonItem;
}
@end
