//
//  MMSettingItem.h
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SettingItemAlignment) {
    SettingItemAlignmentLeft,
    SettingItemAlignmentRight,
    SettingItemAlignmentMiddle,
};

typedef NS_ENUM(NSInteger, SettingItemType) {
    SettingItemTypeDefault,       // image, title, rightTitle, rightImage
    SettingItemTypeButton,        // button
    SettingItemTypeSwitch,        // title， Switch
};



@interface MMSettingItem : NSObject
/*
 *  对齐方式
 *
 *  SettingItemAlignmentLeft,
 *  SettingItemAlignmentRight,
 *  SettingItemAlignmentMiddle,
 */
@property (nonatomic, assign) SettingItemAlignment alignment;

/*
 *  类型
 *
 *  SettingItemTypeDefault,       // image, title, rightTitle, rightImage
 *  SettingItemTypeButton,        // button
 *  SettingItemTypeAvatar,        // title, avatar
 *  SettingItemTypeSwitch,        // title， Switch
 *
 */
@property (nonatomic, assign) SettingItemType type;

/************************ 数据 ************************/
// 1 主图片， 左边
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSURL *imageURL;

// 2 主标题
@property (nonatomic, strong) NSString *title;

// 3.1 中间图片
@property (nonatomic, strong) NSString *middleImageName;
@property (nonatomic, assign) NSURL *middlerImageURL;
// 3.2 图片集
@property (nonatomic, strong) NSArray *subImages;

// 4 副标题
@property (nonatomic, strong) NSString *subTitle;

// 5 右图片
@property (nonatomic, strong) NSString *rightImageName;
@property (nonatomic, strong) NSURL *rightImageURL;


/************************ 样式 ************************/
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *btnBGColor;
@property (nonatomic, strong) UIColor *btnTitleColor;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIColor *subTitleColor;
@property (nonatomic, strong) UIFont *subTitleFont;

@property (nonatomic, assign) CGFloat rightImageHeightOfCell;
@property (nonatomic, assign) CGFloat middleImageHeightOfCell;

/************************ 类方法 ************************/
+ (MMSettingItem *) createWithTitle:(NSString *)title;

+ (MMSettingItem *) createWithImageName:(NSString *)imageName
                                title:(NSString *)title;
+ (MMSettingItem *) createWithTitle:(NSString *)title
                         subTitle:(NSString *)subTitle;
+ (MMSettingItem *) createWithImageName:(NSString *)imageName
                                title:(NSString *)title
                      middleImageName:(NSString *)middleImageName
                             subTitle:(NSString *)subTitle;
+ (MMSettingItem *) createWithImageName:(NSString *)imageName
                                title:(NSString *)title
                             subTitle:(NSString *)subTitle
                       rightImageName:(NSString *)rightImageName;
+ (MMSettingItem *) createWithImageName:(NSString *)imageName
                                title:(NSString *)title
                      middleImageName:(NSString *)middleImageName
                             subTitle:(NSString *)subTitle
                       rightImageName:(NSString *)rightImageName;


@end














#pragma mark - TLSettingGrounp
@interface SettingGrounp : NSObject

/*
 *  组头部标题
 */
@property (nonatomic, strong) NSString *headerTitle;

/*
 *  组尾部说明
 */
@property (nonatomic, strong) NSString *footerTitle;

/*
 *  组元素
 */
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign, readonly) NSUInteger itemsCount;


- (id) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(MMSettingItem *)firstObj, ...;


- (MMSettingItem *) itemAtIndex:(NSUInteger)index;
- (NSUInteger) indexOfItem:(MMSettingItem *)item;

@end