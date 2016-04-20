//
//  MMSettingItem.m
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMSettingItem.h"

@implementation MMSettingItem
- (id) init
{
    if (self = [super init]) {
        self.alignment = SettingItemAlignmentRight;

        self.bgColor = [UIColor whiteColor];
        self.titleColor = [UIColor blackColor];
        self.titleFont = [UIFont systemFontOfSize:15.5f];
        self.subTitleColor = [UIColor grayColor];
        self.subTitleFont = [UIFont systemFontOfSize:15.0f];

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.rightImageHeightOfCell = 0.72;
        self.middleImageHeightOfCell = 0.35;
    }
    return self;
}

+ (MMSettingItem *) createWithTitle:(NSString *)title
{
    return [MMSettingItem createWithImageName:nil title:title];
}

+ (MMSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title
{
    return [MMSettingItem createWithImageName:imageName title:title subTitle:nil rightImageName:nil];
}

+ (MMSettingItem *) createWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    return [MMSettingItem createWithImageName:nil title:title subTitle:subTitle rightImageName:nil];
}

+ (MMSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle
{
    return [MMSettingItem createWithImageName:imageName title:title middleImageName:middleImageName subTitle:subTitle rightImageName:nil];
}

+ (MMSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName
{
    return [MMSettingItem createWithImageName:imageName title:title middleImageName:nil subTitle:subTitle rightImageName:rightImageName];
}

+ (MMSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName
{
    MMSettingItem *item = [[MMSettingItem alloc] init];
    item.imageName = imageName;
    item.middleImageName = middleImageName;
    item.rightImageName = rightImageName;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}

- (void) setAlignment:(SettingItemAlignment)alignment
{
    _alignment = alignment;
    if (alignment == SettingItemAlignmentMiddle) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void) setType:(SettingItemType)type
{
    _type = type;
    if (type == SettingItemTypeSwitch) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else if (type == SettingItemTypeButton) {
        self.btnBGColor = [UIColor greenColor];
        self.btnTitleColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bgColor = [UIColor clearColor];
    }
}

@end












@implementation SettingGrounp

- (id) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(MMSettingItem *)firstObj, ...
{
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc] init];
        va_list argList;
        if (firstObj) {
            [_items addObject:firstObj];
            va_start(argList, firstObj);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
}

- (MMSettingItem *) itemAtIndex:(NSUInteger)index
{
    return [_items objectAtIndex:index];
}

- (NSUInteger) indexOfItem:(MMSettingItem *)item
{
    return [_items indexOfObject:item];
}

- (NSUInteger) itemsCount
{
    return self.items.count;
}

@end