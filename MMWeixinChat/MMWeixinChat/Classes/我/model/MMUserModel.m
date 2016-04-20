//
//  MMUserModel.m
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMUserModel.h"
#import "MMOptions.h"

@implementation MMUserModel
- (void) setUsername:(NSString *)username
{
    _username = username;
    _pinyin = username.pinyin;
    _initial = username.pinyinInitial;
}
@end
