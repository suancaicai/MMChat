//
//  MMBottleViewController.m
//  MMWeixinChat
//
//  Created by yumingming on 16/4/21.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "MMBottleViewController.h"
#import "MMBottleButton.h"
#import "MMOptions.h"

@interface MMBottleViewController ()
{
    NSTimer *timer;
    UITapGestureRecognizer *tap;
}

@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, strong) UIView *bgView;
@end

@implementation MMBottleViewController

#pragma mark - LifeCycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"漂流瓶"];

    [self.navigationItem setRightBarButtonItem:self.rightBarButtonItem];
    [self.view addSubview:self.bgView];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(tryHiddenNavBar) userInfo:nil repeats:NO];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
    [self.view addGestureRecognizer:tap];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self hiddenNavBar:NO];
    [timer invalidate];
    [self.view removeGestureRecognizer:tap];
}

#pragma makr - Event Response
- (void) tryHiddenNavBar
{
    [timer invalidate];
    [self hiddenNavBar:YES];
}

- (void) didTapView
{
    [timer invalidate];
    [self hiddenNavBar:![self.navigationController.navigationBar isHidden]];
}

- (void) rightBarButtonDown
{

}

- (void) bottleButtonDown:(MMBottleButton *)sender
{

}

#pragma mark - Private Methods
- (void) hiddenNavBar:(BOOL)hidden
{
    if (hidden) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        [UIView animateWithDuration:0.5 animations:^{
            [self.navigationController.navigationBar setOriginY: -HEIGHT_NAVBAR - HEIGHT_STATUSBAR];
        } completion:^(BOOL finished) {
            [self.navigationController.navigationBar setHidden:YES];
        }];
    }
    else {
        [self.navigationController.navigationBar setHidden:NO];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController.navigationBar setOriginY:HEIGHT_STATUSBAR];
        }];
    }
}

#pragma mark - Getter and Setter
- (UIBarButtonItem *) rightBarButtonItem
{
    if (_rightBarButtonItem == nil) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    }
    return _rightBarButtonItem;
}

- (UIView *) bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];

        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:_bgView.frame];
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH"];
        int hour = [dateFormatter stringFromDate:date].intValue;
        if (hour >= 6 && hour <= 18) {
            [bgImageView setImage:[UIImage imageNamed:@"bottleBkg.jpg"]];
        }
        else {
            [bgImageView setImage:[UIImage imageNamed:@"bottleNightBkg.jpg"]];
        }
        [_bgView addSubview:bgImageView];

        float h = WIDTH_SCREEN / 640 * 92;
        UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottleBoard"]];
        [bottomImageView setFrame:CGRectMake(0, HEIGHT_SCREEN - h, WIDTH_SCREEN, h)];
        [_bgView addSubview:bottomImageView];

        float w = WIDTH_SCREEN / 4;
        float space = (WIDTH_SCREEN - w * 3) / 4;
        h = w / 152 * 172 + 10;
        float y = HEIGHT_SCREEN - h;
        float x = space;
        MMBottleButton *throwButton = [[MMBottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                                  imageName:@"bottleButtonThrow"
                                                                      title:@"扔一个"
                                                                     target:self
                                                                     action:@selector(bottleButtonDown:)];
        throwButton.tag = 1;
        [_bgView addSubview:throwButton];

        x += w + space;
        MMBottleButton *gatherButton = [[MMBottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                                   imageName:@"bottleButtonFish"
                                                                       title:@"捡一个"
                                                                      target:self
                                                                      action:@selector(bottleButtonDown:)];
        gatherButton.tag = 2;
        [_bgView addSubview:gatherButton];


        x += w + space;
        MMBottleButton *mineButton = [[MMBottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                                 imageName:@"bottleButtonMine"
                                                                     title:@"我的瓶子"
                                                                    target:self
                                                                    action:@selector(bottleButtonDown:)];
        mineButton.tag = 3;
        [_bgView addSubview:mineButton];
    }
    return _bgView;
}

@end
