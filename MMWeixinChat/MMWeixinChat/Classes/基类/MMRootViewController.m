//
//  MMRootViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMRootViewController.h"
#import "MMOptions.h"
#import "MMNavigationViewController.h"
#import "MMConversationViewController.h"
#import "MMFriendsViewController.h"
#import "MMDiscoverViewController.h"
#import "MMMineViewController.h"

@interface MMRootViewController ()
@property (nonatomic, strong) MMConversationViewController *conversationVC;
@property (nonatomic, strong) MMFriendsViewController *friendsVC;
@property (nonatomic, strong) MMDiscoverViewController *discoverVC;
@property (nonatomic, strong) MMMineViewController *mineVC;
@end

@implementation MMRootViewController

#pragma mark - LifeCycle

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:WBColor(239.0, 239.0, 244.0, 1.0)];
    [self.tabBar setTintColor:WBColor(2.0, 187.0, 0.0, 1.0f)];


    MMNavigationViewController *convNavC = [[MMNavigationViewController alloc] initWithRootViewController:self.conversationVC];
    MMNavigationViewController *friendNavC = [[MMNavigationViewController alloc] initWithRootViewController:self.friendsVC];
    MMNavigationViewController *discoverNavC = [[MMNavigationViewController alloc] initWithRootViewController:self.discoverVC];
    MMNavigationViewController *mineNavC = [[MMNavigationViewController alloc] initWithRootViewController:self.mineVC];
    [self setViewControllers:@[convNavC, friendNavC, discoverNavC, mineNavC]];
}

#pragma mark - Getter and Setter
/**
 *  消息
 */
- (MMConversationViewController *) conversationVC
{
    if (_conversationVC == nil) {
        _conversationVC = [[MMConversationViewController alloc] init];
        [_conversationVC.tabBarItem setTitle:@"消息"];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}

/**
 *  通讯录
 */
- (MMFriendsViewController *) friendsVC
{
    if (_friendsVC == nil) {
        _friendsVC = [[MMFriendsViewController alloc] init];
        [_friendsVC.tabBarItem setTitle:@"通讯录"];
        [_friendsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_friendsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _friendsVC;
}

/**
 *  发现
 */
- (MMDiscoverViewController *) discoverVC
{
    if (_discoverVC == nil) {
        _discoverVC = [[MMDiscoverViewController alloc] init];
        [_discoverVC.tabBarItem setTitle:@"发现"];
        [_discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _discoverVC;
}

/**
 *  我
 */
- (MMMineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[MMMineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}



@end
