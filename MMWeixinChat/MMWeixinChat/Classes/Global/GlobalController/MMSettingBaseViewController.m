//
//  MMSettingBaseViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMSettingBaseViewController.h"
#import "MMOptions.h"
#import "MMSettingCell.h"
#import "MMSettingHeaderFooteView.h"
@implementation MMSettingBaseViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)]];

    [self.tableView registerClass:[MMSettingCell class] forCellReuseIdentifier:@"MMSettingCell"];
    [self.tableView registerClass:[MMSettingHeaderFooteView class] forHeaderFooterViewReuseIdentifier:@"MMSettingHeaderFooteView"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGrounp *group = [_data objectAtIndex:section];
    return group.itemsCount;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingGrounp *group = [_data objectAtIndex:indexPath.section];
    MMSettingItem *item = [group itemAtIndex:indexPath.row];
    MMSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMSettingCell"];
    [cell setItem:item];

    // cell分割线
    if (item.type != SettingItemTypeButton) {
        indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    }
    else {
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottomLineStyle:CellLineStyleNone];
    }

    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MMSettingHeaderFooteView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MMSettingHeaderFooteView"];
    if (_data && _data.count > section) {
        SettingGrounp *group = [_data objectAtIndex:section];
        [view setText:group.headerTitle];
    }
    return view;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    MMSettingHeaderFooteView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MMSettingHeaderFooteView"];
    if (_data && _data.count > section) {
        SettingGrounp *group = [_data objectAtIndex:section];
        [view setText:group.footerTitle];
    }
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_data && _data.count > indexPath.section) {
        SettingGrounp *group = [_data objectAtIndex:indexPath.section];
        MMSettingItem *item = [group itemAtIndex:indexPath.row];
        return [MMSettingCell getHeightForText:item];
    }
    return 0.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_data && _data.count > section) {
        SettingGrounp *group = [_data objectAtIndex:section];
        if (group.headerTitle == nil) {
            return section == 0 ? 15.0f : 10.0f;
        }
        return [MMSettingHeaderFooteView getHeightForText:group.headerTitle];
    }
    return 10.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_data && _data.count > section) {
        SettingGrounp *group = [_data objectAtIndex:section];
        if (group.footerTitle == nil) {
            return section == _data.count - 1 ? 30.0f : 10.0f;
        }
        return [MMSettingHeaderFooteView getHeightForText:group.footerTitle];
    }
    return 10.0f;
}

@end
