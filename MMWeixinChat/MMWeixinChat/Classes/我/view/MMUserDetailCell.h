//
//  MMUserDetailCell.h
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "MMUserModel.h"
typedef NS_ENUM(NSInteger, UserDetailCellType) {
    UserDetailCellTypeFriends,
    UserDetailCellTypeMine,
};
@interface MMUserDetailCell : CommonTableViewCell

@property (nonatomic, assign) UserDetailCellType cellType;

@property (nonatomic, strong) MMUserModel *user;

@end
