//
//  MMSettingHeaderFooteView.h
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSettingHeaderFooteView : UITableViewHeaderFooterView
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) UILabel *titleLabel;

+ (CGFloat) getHeightForText:(NSString *)text;
@end

