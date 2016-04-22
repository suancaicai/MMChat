//
//  MMCodeViewController.h
//  MMProject
//
//  Created by yumingming on 16/4/12.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMCodeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *myName;
@property (weak, nonatomic) IBOutlet UILabel *myAdress;
@property (weak, nonatomic) IBOutlet UIImageView *myCode;


-(void)uploadCodeData:(NSArray*)data fromViewController:(NSString *)string;

@end
