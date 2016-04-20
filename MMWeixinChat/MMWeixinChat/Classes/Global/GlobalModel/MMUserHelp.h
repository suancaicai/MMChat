//
//  MMUserHelp.h
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMUserModel.h"
@interface MMUserHelp : NSObject
@property (nonatomic, strong) MMUserModel *user;
+ (MMUserHelp *)sharedUserHelper;
@end


