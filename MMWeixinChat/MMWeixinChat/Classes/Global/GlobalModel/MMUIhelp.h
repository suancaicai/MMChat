//
//  MMUIhelp.h
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMSettingItem.h"

@interface MMUIhelp : NSObject

+ (SettingGrounp *) getFriensListItemsGroup;
+ (NSMutableArray *) getDiscoverItems;
+ (NSMutableArray *) getMineVCItems;
+ (NSMutableArray *) getDetailVCItems;
+ (NSMutableArray *) getDetailSettingVCItems;
+ (NSMutableArray *) getMineDetailVCItems;

+ (NSMutableArray *) getSettingVCItems;
+ (NSMutableArray *) getNewNotiVCItems;

@end
