//
//  MMShakeMenuButton.h
//  MMProject
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMShakeMenuButton : UIButton

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *imageHL;

- (id) initWithFrame:(CGRect)frame
           imageName:(NSString *) imageName
         imageHLName:(NSString *) imageHLName
               title:(NSString *)title
              target:(id)target
              action:(SEL)action;
- (void) setChoosed:(BOOL)choosed;

@end
