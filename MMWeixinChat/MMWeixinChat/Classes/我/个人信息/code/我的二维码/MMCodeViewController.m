//
//  MMCodeViewController.m
//  MMProject
//
//  Created by yumingming on 16/4/12.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMCodeViewController.h"
#import "MMOptions.h"

@interface MMCodeViewController ()
{
    UIImage *codeImage;
    QRPointType pointType;
    QRPositionType positionType;
    UIColor *codeColor;
}
@end

@implementation MMCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myHeaderImage.layer.cornerRadius = 5;
    self.myHeaderImage.layer.masksToBounds = YES;
    pointType = QRPointRound;
    positionType = QRPositionRound;
    codeColor = [UIColor greenColor];
    self.myCode.layer.shadowOffset = CGSizeMake(0, 0.5);  // 设置阴影的偏移量
    self.myCode.layer.shadowRadius = 1;  // 设置阴影的半径
    self.myCode.layer.shadowColor = [UIColor blackColor].CGColor; // 设置阴影的颜色为黑色
    self.myCode.layer.shadowOpacity = 0.3; // 设置阴影的不透明度
}


-(void)uploadCodeData:(NSArray*)data fromViewController:(NSString *)string{
    CGRect frame;
    if ([string isEqualToString:@"MMAddFriendsTableViewController"]) {
        frame = CGRectMake(10, 40, self.view.frame.size.width-20, 380);
    }else{
        frame = CGRectMake(10, 100, self.view.frame.size.width-20, 380);
    }
    self.view.frame = frame;

    self.myHeaderImage.image = [UIImage imageNamed:data[0]];
    self.myName.text = [NSString stringWithFormat:@"%@",data[1]];
    self.myAdress.text = [NSString stringWithFormat:@"%@",data[2]];
    self.myCode.image = [QRCodeGenerator qrImageForString:@"11111" imageSize:self.myCode.bounds.size.width withPointType:pointType withPositionType:positionType withColor:codeColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
