//
//  UIDevice+MMDevice.m
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "UIDevice+MMDevice.h"

#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height
@implementation UIDevice (MMDevice)
+ (DeviceVerType)deviceVerType{
    if (WIDTH_SCREEN == 375) {
        return DeviceVer6;
    }else if (WIDTH_SCREEN == 414){
        return DeviceVer6P;
    }else if(HEIGHT_SCREEN == 480){
        return DeviceVer4;
    }else if (HEIGHT_SCREEN == 568){
        return DeviceVer5;
    }
    return DeviceVer4;
}
@end
