//
//  MMBottleButton.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/21.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMBottleButton.h"

@implementation MMBottleButton

- (id) initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action
{
    if (self = [super initWithFrame:frame]) {

        [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];


        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 10)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [self addSubview:imageView];


        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 18, frame.size.width, 10)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setText:title];
        [titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
    }
    return self;
}

@end
