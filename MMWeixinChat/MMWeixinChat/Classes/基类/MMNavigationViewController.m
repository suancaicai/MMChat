//
//  MMNavigationViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/18.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMNavigationViewController.h"
#import "MMOptions.h"

@interface MMNavigationViewController ()

@end

@implementation MMNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationBar setBarTintColor:WBColor(20.0, 20.0, 20.0, 0.9)];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:WBColor(239.0, 239.0, 244.0, 1.0)];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
