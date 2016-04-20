//
//  MMFriendsViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMFriendsViewController.h"
#import "MMOptions.h"
#import "MMFriendCell.h"
#import "MMFriendHeaderView.h"
#import "MMDataHelp.h"
#import "MMFriendSearchViewController.h"
#import "MMFriendDetailsViewController.h"
@interface MMFriendsViewController () <UISearchBarDelegate>

@property (nonatomic, strong) SettingGrounp *functionGroup;     // 功能列表

@property (nonatomic, strong) UIBarButtonItem *addFriendButton;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UILabel *footerLabel;

//@property (nonatomic, strong) TLAddFriendViewController *addFriendVC;

@property (nonatomic, strong) MMFriendSearchViewController *searchVC;
@property (nonatomic, strong) MMFriendDetailsViewController *detailsVC;

@end
@implementation MMFriendsViewController




#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"通讯录"];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:WBColor(20.0, 20.0, 20.0, 0.9)];

    // SubViews
    [self.tableView registerClass:[MMFriendCell class] forCellReuseIdentifier:@"MMFriendCell"];
    [self.tableView registerClass:[MMFriendHeaderView class] forHeaderFooterViewReuseIdentifier:@"MMFriendHeaderView"];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView setTableFooterView:self.footerLabel];
    [self.navigationItem setRightBarButtonItem:self.addFriendButton];
    // 测试
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
    return _data.count + 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _functionGroup.itemsCount;
    }
    NSArray *array = [_data objectAtIndex:section - 1];
    return array.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    MMFriendHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MMFriendHeaderView"];
    [view setTitle:[self.section objectAtIndex:section]];
    return view;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMFriendCell"];
    if (indexPath.section == 0) {
        MMSettingItem *item = [_functionGroup itemAtIndex:indexPath.row];
        MMUserModel *user = [[MMUserModel alloc] init];
        user.username = item.title;
        user.avatarURL = item.imageName;
        [cell setUser:user];
        [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == _functionGroup.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleNone] :[cell setBottomLineStyle:CellLineStyleDefault];
    }
    else {
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        MMUserModel *user = [array objectAtIndex:indexPath.row];
        [cell setUser:user];
        [cell setTopLineStyle:CellLineStyleNone];

        if (indexPath.row == array.count - 1) {
            indexPath.section == _data.count ? [cell setBottomLineStyle:CellLineStyleFill] :[cell setBottomLineStyle:CellLineStyleNone];
        }
        else {
            [cell setBottomLineStyle:CellLineStyleDefault];
        }
    }

    return cell;
}

// 拼音首字母检索
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _section;
}

// 检索时空出搜索框
- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];
        return -1;
    }
    return index;
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.5f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 22.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {

    }
    else {
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        self.detailsVC.user = [array objectAtIndex:indexPath.row];;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.detailsVC animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UISearchBarDelegate
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    _searchVC.friendsArray = self.friendsArray;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
}

#pragma mark - Event Response
- (void) addFriendButtonDown
{
    [self setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:self.addFriendVC animated:YES];
}
#pragma mark - Private Methods
- (void) initTestData
{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _friendsArray = [[NSMutableArray alloc] initWithCapacity:3];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"FriendsList" ofType:@"plist"];
        NSArray *plistArray =[NSArray arrayWithContentsOfFile:plistPath];
        for (NSDictionary *dict in plistArray) {
            MMUserModel *user1 = [[MMUserModel alloc] init];
            user1.username = dict[@"username"];
            user1.nikename = dict[@"nikename"];
            user1.userID = dict[@"userID"];
            user1.avatarURL = dict[@"avatarURL"];
            [_friendsArray addObject:user1];
        }
        _functionGroup = [MMUIhelp getFriensListItemsGroup];
        _data = [MMDataHelp getFriendListDataBy:_friendsArray];
        _section = [MMDataHelp getFriendListSectionBy:_data];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [_footerLabel setText:[NSString stringWithFormat:@"%lu位联系人", (unsigned long)_friendsArray.count]];
        });
    });
}



#pragma mark - Getter and Setter
- (UIBarButtonItem *) addFriendButton
{
    if (_addFriendButton == nil) {
        _addFriendButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriendButtonDown)];
    }
    return _addFriendButton;
}

- (MMFriendSearchViewController *) searchVC
{
    if (_searchVC == nil) {
        _searchVC = [[MMFriendSearchViewController alloc] init];
    }
    return _searchVC;
}

- (UISearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        [_searchController setSearchResultsUpdater: self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:WBColor(239.0, 239.0, 244.0, 1.0)];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:WBColor(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

- (UILabel *) footerLabel
{
    if (_footerLabel == nil) {
        _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 49.0f)];
        [_footerLabel setBackgroundColor:[UIColor whiteColor]];
        [_footerLabel setTextColor:[UIColor grayColor]];
        [_footerLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _footerLabel;
}



- (MMFriendDetailsViewController *) detailsVC
{
    if (_detailsVC == nil) {
        _detailsVC = [[MMFriendDetailsViewController alloc] init];
    }
    return _detailsVC;
}


@end
