//
//  MMMyCodeViewController.m
//  MMProject
//
//  Created by yumingming on 16/4/15.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMMyCodeViewController.h"
#import "MMCodeViewController.h"
#import "MMOptions.h"

@interface MMMyCodeViewController ()
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;

@end

@implementation MMMyCodeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationItem setRightBarButtonItem:self.rightBarButtonItem];
    self.title = @"我的二维码";
    [self showCodeView];
}


-(void)showCodeView{
    MMCodeViewController *codeView = [[MMCodeViewController alloc] initWithNibName:@"MMCodeViewController" bundle:[NSBundle mainBundle]];
    NSArray *array =[NSArray arrayWithObjects:@"11.png",@"ymm",@"河南 郑州", nil];
    [self.view addSubview:codeView.view];
    //    判断是从哪个页面跳转过来的
    [codeView uploadCodeData:array fromViewController:@"MMMyCodeViewController"];

}

-(void)rightBarButtonDown{


}

#pragma mark - Getter and Setter
- (UIBarButtonItem *) rightBarButtonItem
{
    if (_rightBarButtonItem == nil) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    }
    return _rightBarButtonItem;
}

@end
