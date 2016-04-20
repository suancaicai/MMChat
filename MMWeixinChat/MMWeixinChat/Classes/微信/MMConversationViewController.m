//
//  MMConversationViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMConversationViewController.h"
#import "MMOptions.h"


@interface MMConversationViewController ()
{

    DTKDropdownMenuView *menuView;

}
@property (nonatomic, strong) UIBarButtonItem *navRightButton;
@end
@implementation MMConversationViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"消息"];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];

    [self navRightButtonDown];
//    // subView
//    [self.navigationItem setRightBarButtonItem:self.navRightButton];        // nav菜单

}
#pragma mark - Event Response
- (void) navRightButtonDown
{
    __weak typeof(self) weakSelf = self;
    DTKDropdownItem *item0 = [DTKDropdownItem itemWithTitle:@"发起群聊" iconName:@"contacts_add_friend" callBack:^(NSUInteger index, id info) {
        NSLog(@"rightItem%lu",(unsigned long)index);
        [weakSelf model];
    }];
    DTKDropdownItem *item1 = [DTKDropdownItem itemWithTitle:@"添加朋友" iconName:@"contacts_add_friend" callBack:^(NSUInteger index, id info) {
        NSLog(@"rightItem%lu",(unsigned long)index);
        [weakSelf push];
    }];
    DTKDropdownItem *item2 = [DTKDropdownItem itemWithTitle:@"扫一扫" iconName:@"contacts_add_friend" callBack:^(NSUInteger index, id info) {
        NSLog(@"rightItem%lu",(unsigned long)index);
        [weakSelf push];
    }];
    DTKDropdownItem *item3 = [DTKDropdownItem itemWithTitle:@"收付款" iconName:@"contacts_add_friend" callBack:^(NSUInteger index, id info) {
        NSLog(@"rightItem%lu",(unsigned long)index);
        [weakSelf model];
    }];

    menuView = [DTKDropdownMenuView dropdownMenuViewWithType:dropDownTypeRightItem frame:CGRectMake(0, 0, 40.f, 30.f) dropdownItems:@[item0,item1,item2,item3] icon:@"barbuttonicon_add"];
    
    menuView.dropWidth = 150.f;
    menuView.cellColor = [UIColor grayColor];
    menuView.titleFont = [UIFont systemFontOfSize:18.f];
    menuView.textColor = [UIColor whiteColor];
    menuView.textFont = [UIFont systemFontOfSize:13.f];
    menuView.cellSeparatorColor = [UIColor whiteColor];
    menuView.textFont = [UIFont systemFontOfSize:14.f];
    menuView.animationDuration = 0.2f;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:menuView];

}
-(void)model{
    //    UIViewController *vc = [[[self class] alloc]init];
    //    [self presentViewController:vc animated:YES completion:^{
    //
    //    }];
}
- (void)push{

//        UIViewController *vc = [[[self class] alloc]init];
//        [self presentViewController:vc animated:YES completion:^{
//    
//        }];
//    Class temp;
//
//    switch (menuView.selectedIndex) {
//        case 0:{
//            //    UIViewController *vc = [[[self class] alloc]init];
//        }
//            break;
//        case 1:
//            temp = [MMAddFriendsTableViewController class];
//            break;
//        case 2:
//            temp = [ZBarScanViewController class];
//            break;
//        case 3:
//
//            break;
//
//        default:
//            break;
//    }
//    tempView = [[temp alloc]init];
//
//    [self.navigationController pushViewController:tempView animated:YES];

}
//#pragma mark - Getter and Setter
//- (UIBarButtonItem *) navRightButton
//{
//    if (_navRightButton == nil) {
//        _navRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(navRightButtonDown)];
//    }
//    return _navRightButton;
//}

@end
