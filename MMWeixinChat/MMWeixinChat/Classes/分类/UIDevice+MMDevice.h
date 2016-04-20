//
//  UIDevice+MMDevice.h
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DeviceVerType){
    DeviceVer4,
    DeviceVer5,
    DeviceVer6,
    DeviceVer6P,
};

@interface UIDevice (MMDevice)
+ (DeviceVerType)deviceVerType;

@end
