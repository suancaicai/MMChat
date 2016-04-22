//
//  MMUIhelp.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMUIhelp.h"

@implementation MMUIhelp
+ (SettingGrounp *) getFriensListItemsGroup
{
    MMSettingItem *notify = [MMSettingItem createWithImageName:@"plugins_FriendNotify" title:@"新的朋友"];
    MMSettingItem *friendGroup = [MMSettingItem createWithImageName:@"add_friend_icon_addgroup" title:@"群聊"];
    MMSettingItem *tag = [MMSettingItem createWithImageName:@"Contact_icon_ContactTag" title:@"标签"];
    MMSettingItem *offical = [MMSettingItem createWithImageName:@"add_friend_icon_offical" title:@"公众号"];
    SettingGrounp *group = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:notify, friendGroup, tag, offical, nil];
    return group;
}

+ (NSMutableArray *) getMineVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    MMSettingItem *album = [MMSettingItem createWithImageName:@"MoreMyAlbum" title:@"相册"];
    MMSettingItem *favorite = [MMSettingItem createWithImageName:@"MoreMyFavorites" title:@"收藏"];
    MMSettingItem *bank = [MMSettingItem createWithImageName:@"MoreMyBankCard" title:@"钱包"];
    MMSettingItem *card = [MMSettingItem createWithImageName:@"MyCardPackageIcon" title:@"卡包"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:group1];

    MMSettingItem *expression = [MMSettingItem createWithImageName:@"MoreExpressionShops" title:@"表情"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:group2];

    MMSettingItem *setting = [MMSettingItem createWithImageName:@"MoreSetting" title:@"设置"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group3];
    return items;
}

+ (NSMutableArray *) getDiscoverItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    MMSettingItem *friendsAlbum = [MMSettingItem createWithImageName:@"ff_IconShowAlbum" title:@"朋友圈" subTitle:nil rightImageName:@"2.jpg"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:friendsAlbum, nil];
    [items addObject:group1];

    MMSettingItem *qrCode = [MMSettingItem createWithImageName:@"ff_IconQRCode" title:@"扫一扫"];
    MMSettingItem *shake = [MMSettingItem createWithImageName:@"ff_IconShake" title:@"摇一摇"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:qrCode, shake, nil];
    [items addObject:group2];

    MMSettingItem *loacation = [MMSettingItem createWithImageName:@"ff_IconLocationService" title:@"附近的人" subTitle:nil rightImageName:@"FootStep"];
    loacation.rightImageHeightOfCell = 0.43;
    MMSettingItem *bottle = [MMSettingItem createWithImageName:@"ff_IconBottle" title:@"漂流瓶"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:loacation, bottle, nil];
    [items addObject:group3];

    MMSettingItem *shopping = [MMSettingItem createWithImageName:@"CreditCard_ShoppingBag" title:@"购物"];
    MMSettingItem *game = [MMSettingItem createWithImageName:@"MoreGame" title:@"游戏" subTitle:@"超火力新枪战" rightImageName:@"game_tag_icon"];
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:shopping, game, nil];
    [items addObject:group4];

    return items;
}

+ (NSMutableArray *) getDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    MMSettingItem *tag = [MMSettingItem createWithTitle:@"设置备注和标签"];
//    MMSettingItem *phone = [MMSettingItem createWithTitle:@"电话号码" subTitle:@"18888888888"];
//    phone.alignment = SettingItemAlignmentLeft;
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, nil];
    [items addObject:group1];
    MMSettingItem *position = [MMSettingItem createWithTitle:@"地区" subTitle:@"山东 青岛"];
    position.alignment = SettingItemAlignmentLeft;
    MMSettingItem *album = [MMSettingItem createWithTitle:@"个人相册"];
    album.subImages = @[@"bottleBkg", @"bottleBkg", @"bottleBkg", @"bottleBkg"];
    album.alignment = SettingItemAlignmentLeft;
    MMSettingItem *more = [MMSettingItem createWithTitle:@"更多"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:position, album, more, nil];
    [items addObject:group2];

    MMSettingItem *chatButton = [MMSettingItem createWithTitle:@"发消息"];
    chatButton.type = SettingItemTypeButton;
    MMSettingItem *videoButton = [MMSettingItem createWithTitle:@"视频聊天"];
    videoButton.type = SettingItemTypeButton;
    videoButton.btnBGColor = [UIColor whiteColor];
    videoButton.btnTitleColor = [UIColor blackColor];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:chatButton, videoButton, nil];
    [items addObject:group3];

    return items;
}

+ (NSMutableArray *) getMineDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    MMSettingItem *avatar = [MMSettingItem createWithImageName:nil title:@"头像" subTitle:nil rightImageName:@"bottleBkg"];
    MMSettingItem *name = [MMSettingItem createWithTitle:@"名字" subTitle:@"Bay、栢"];
    MMSettingItem *num = [MMSettingItem createWithTitle:@"微信号" subTitle:@"li-bokun"];
    MMSettingItem *code = [MMSettingItem createWithTitle:@"我的二维码"];
    MMSettingItem *address = [MMSettingItem createWithTitle:@"我的地址"];
    SettingGrounp *frist = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:avatar, name, num, code, address, nil];
    [items addObject:frist];

    MMSettingItem *sex = [MMSettingItem createWithTitle:@"性别" subTitle:@"男"];
    MMSettingItem *pos = [MMSettingItem createWithTitle:@"地址" subTitle:@"山东 滨州"];
    MMSettingItem *proverbs = [MMSettingItem createWithTitle:@"个性签名" subTitle:@"Hello world!"];
    SettingGrounp *second = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:sex, pos, proverbs, nil];
    [items addObject:second];

    return items;
}

+ (NSMutableArray *) getSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    MMSettingItem *safe = [MMSettingItem createWithImageName:nil title:@"账号和安全" middleImageName:@"ProfileLockOn" subTitle:@"已保护"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:safe, nil];
    [items addObject:group1];

    MMSettingItem *noti = [MMSettingItem createWithTitle:@"新消息通知"];
    MMSettingItem *privacy = [MMSettingItem createWithTitle:@"隐私"];
    MMSettingItem *normal = [MMSettingItem createWithTitle:@"通用"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:noti, privacy, normal, nil];
    [items addObject:group2];

    MMSettingItem *feedBack = [MMSettingItem createWithTitle:@"帮助与反馈"];
    MMSettingItem *about = [MMSettingItem createWithTitle:@"关于微信"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:feedBack, about, nil];
    [items addObject:group3];

    MMSettingItem *exit = [MMSettingItem createWithTitle:@"退出登陆"];
    [exit setAlignment:SettingItemAlignmentMiddle];
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:exit, nil];
    [items addObject:group4];

    return items;
}

+ (NSMutableArray *) getDetailSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];

    MMSettingItem *tag = [MMSettingItem createWithTitle:@"设置备注及标签"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, nil];
    [items addObject:group1];

    MMSettingItem *recommend = [MMSettingItem createWithTitle:@"把他推荐给好友"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:recommend, nil];
    [items addObject:group2];

    MMSettingItem *starFriend = [MMSettingItem createWithTitle:@"把它设为星标朋友"];
    starFriend.type = SettingItemTypeSwitch;
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:starFriend, nil];
    [items addObject:group3];

    MMSettingItem *prohibit = [MMSettingItem createWithTitle:@"不让他看我的朋友圈"];
    prohibit.type = SettingItemTypeSwitch;
    MMSettingItem *ignore = [MMSettingItem createWithTitle:@"不看他的朋友圈"];
    ignore.type = SettingItemTypeSwitch;
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:prohibit, ignore, nil];
    [items addObject:group4];

    MMSettingItem *addBlacklist = [MMSettingItem createWithTitle:@"加入黑名单"];
    addBlacklist.type = SettingItemTypeSwitch;
    MMSettingItem *report = [MMSettingItem createWithTitle: @"举报"];
    SettingGrounp *group5 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:addBlacklist, report, nil];
    [items addObject:group5];

    MMSettingItem *delete = [MMSettingItem createWithTitle:@"删除好友"];
    delete.type = SettingItemTypeButton;
    SettingGrounp *group6 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:delete, nil];
    [items addObject:group6];

    return items;
}

+ (NSMutableArray *) getNewNotiVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];

    MMSettingItem *recNoti = [MMSettingItem createWithTitle:@"接受新消息通知" subTitle:@"已开启"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"如果你要关闭或开启微信的新消息通知，请在iPhone的“设置” - “通知”功能中，找到应用程序“微信”更改。" settingItems:recNoti, nil];
    [items addObject:group1];

    MMSettingItem *showDetail = [MMSettingItem createWithTitle:@"通知显示详情信息"];
    showDetail.type = SettingItemTypeSwitch;
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要。" settingItems:showDetail, nil];
    [items addObject:group2];

    MMSettingItem *disturb = [MMSettingItem createWithTitle:@"功能消息免打扰"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"设置系统功能消息提示声音和振动时段。" settingItems:disturb, nil];
    [items addObject:group3];

    MMSettingItem *voice = [MMSettingItem createWithTitle:@"声音"];
    voice.type = SettingItemTypeSwitch;
    MMSettingItem *shake = [MMSettingItem createWithTitle:@"震动"];
    shake.type = SettingItemTypeSwitch;
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"当微信在运行时，你可以设置是否需要声音或者振动。" settingItems:voice, shake, nil];
    [items addObject:group4];

    MMSettingItem *friends = [MMSettingItem createWithTitle:@"朋友圈照片更新"];
    friends.type = SettingItemTypeSwitch;
    SettingGrounp *group5 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。" settingItems:friends, nil];
    [items addObject:group5];
    
    return items;
}
@end
