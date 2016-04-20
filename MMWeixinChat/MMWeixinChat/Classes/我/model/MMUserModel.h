//
//  MMUserModel.h
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMUserModel : NSObject
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *nikename;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) NSString *phoneNumber;

@property (nonatomic, strong) NSString *pinyin;
@property (nonatomic, strong) NSString *initial;

@end
