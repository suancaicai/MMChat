//
//  MMSettingCell.h
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "MMOptions.h"

@interface MMSettingCell : CommonTableViewCell

@property (nonatomic, strong) MMSettingItem *item;

+ (CGFloat) getHeightForText:(MMSettingItem *)item;
@end
