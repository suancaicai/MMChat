//
//  MMFriendsViewController.h
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMBaseTableViewController.h"

@interface MMFriendsViewController : MMBaseTableViewController
@property (nonatomic, strong) NSMutableArray *friendsArray;     // 好友列表数据
@property (nonatomic, strong) NSMutableArray *data;             // 格式化的好友列表数据
@property (nonatomic, strong) NSMutableArray *section;          // 拼音首字母列表

@end
