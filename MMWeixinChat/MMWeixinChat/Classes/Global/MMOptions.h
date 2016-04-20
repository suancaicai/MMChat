//
//  MMOptions.h
//  MMWeixinChat
//
//  Created by yumingming on 16/4/19.
//  Copyright © 2016年 MM. All rights reserved.
//

#ifndef MMOptions_h
#define MMOptions_h

//
#import "MMUIhelp.h"
#import "MMSettingItem.h"


//categray

#import "NSString+MMStringSize.h"
#import "UIDevice+MMDevice.h"
#import "UIView+MMView.h"
#import "UIViewController+MJPopupViewController.h"
#import "DTKDropdownMenuView.h"



#define appDelegate        ((AppDelegate*)[[UIApplication sharedApplication] delegate])


#pragma mark - Frame

#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height
#define HEIGHT_STATUSBAR	20
#define HEIGHT_TABBAR       49
#define HEIGHT_NAVBAR       44
#define HEIGHT_CHATBOXVIEW  215

//这里写颜色  位置等
#define WBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]



#endif /* MMOptions_h */
