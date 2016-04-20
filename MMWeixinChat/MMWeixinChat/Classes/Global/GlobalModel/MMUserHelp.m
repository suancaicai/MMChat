//
//  MMUserHelp.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMUserHelp.h"
static MMUserHelp *userHelper = nil;

@implementation MMUserHelp
+ (MMUserHelp *)sharedUserHelper
{
    if (userHelper == nil) {
        userHelper = [[MMUserHelp alloc] init];
    }
    return userHelper;
}

- (MMUserModel *) user
{
    if (_user == nil) {
        _user = [[MMUserModel alloc] init];
        _user.username = @"Bay、栢";
        _user.userID = @"li-bokun";
        _user.avatarURL = @"bottleBkg";
    }
    return _user;
}

@end


