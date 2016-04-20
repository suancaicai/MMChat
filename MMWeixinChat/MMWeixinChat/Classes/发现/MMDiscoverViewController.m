//
//  MMDiscoverViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMDiscoverViewController.h"
#import "MMUIhelp.h"
#import "MMShakeViewController.h"



@interface MMDiscoverViewController ()
@property (nonatomic , strong)MMShakeViewController *shakeVC;
@end
@implementation MMDiscoverViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"发现"];
    self.data = [MMUIhelp getDiscoverItems];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingGrounp *group = [self.data objectAtIndex:indexPath.section];
    MMSettingItem *item = [group itemAtIndex:indexPath.row];
    id vc;
    if ([item.title isEqualToString:@"摇一摇"]) {
        vc = self.shakeVC;
    }
//    else if ([item.title isEqualToString:@"漂流瓶"]) {
//        vc = self.bottleVC;
//    }
//    else if ([item.title isEqualToString:@"购物"]) {
//        vc = self.shoppingVC;
//    }

    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Getter and Setter
- (MMShakeViewController *) shakeVC
{
    if (_shakeVC == nil) {
        _shakeVC = [[MMShakeViewController alloc] init];
    }
    return _shakeVC;
}

//- (TLBottleViewController *) bottleVC
//{
//    if (_bottleVC == nil) {
//        _bottleVC = [[TLBottleViewController alloc] init];
//    }
//    return _bottleVC;
//}
//
//- (TLShoppingViewController *) shoppingVC
//{
//    if (_shoppingVC == nil) {
//        _shoppingVC= [[TLShoppingViewController alloc] init];
//    }
//    return _shoppingVC;
//}


@end
