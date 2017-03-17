//
//  {{args.Prefix}}SplashScreenController.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}SplashScreenController.h"
#import <HTSplashADView/HTSplashADView.h>
#import "HTControllerRouter.h"

@interface {{args.Prefix}}SplashScreenController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation {{args.Prefix}}SplashScreenController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
    [self loadSubviews];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _backgroundImageView.frame = self.view.bounds;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _backgroundImageView = [[UIImageView alloc] init];
    
    NSString *launchImageName;
    CGFloat screenHeight = SCREEN_HEIGHT;
    
    if (screenHeight == 480) {
        launchImageName = @"LaunchImage-700@2x.png";
    } else if (screenHeight == 568) {
        launchImageName = @"LaunchImage-700-568h@2x.png";
    } else if (screenHeight == 667) {
        launchImageName = @"LaunchImage-800-667h@2x.png";
    } else {
        launchImageName = @"LaunchImage-800-Portrait-736h@3x.png";
    }
    
    _backgroundImageView.image = [UIImage imageNamed:launchImageName];
    [self.view addSubview:_backgroundImageView];
}


- (void)loadSplashView{
    @{{args.Prefix}}Weak(self);
    HTSplashADView * adView = [[HTSplashADView alloc] initWithFrame:[UIScreen mainScreen].bounds finished:^(HTSplashData *splashData, BOOL gotoAd) {
        // 判断是否有广告页来显示，如果没有的话，显示app启动页. 如果有广告页，则走广告页面流程，根据router来跳转到webview来展示对应广告页面
        if ([HTSplashADManager sharedInstance].getSplashData == nil) {
            NSUInteger showTime = 3;  //设置启动页显示时长
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(showTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if ([_delegate respondsToSelector:@selector(splashScreenDidDisappear:)]) {
                    [_delegate splashScreenDidDisappear:weakSelf];
                }
            });
        }else{
            if ([_delegate respondsToSelector:@selector(splashScreenDidDisappear:)]) {
                [_delegate splashScreenDidDisappear:weakSelf];
            }
            //这里针对闪屏之后的广告页跳转，可以通过gotoAd来判断是否需要跳转到对应的广告页面，页面信息在splashData内可以拿到
            if (gotoAd) {
                if (splashData.linkUrl) {
                    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
                    param.url = @"{{args.ProductName}}://webview";
                    param.launchMode = HTControllerLaunchModePushNavigation;
                    param.fromViewController = [APPDELEGATE() rootNavigationController];
                    param.delegate = self;
                    param.params = @{@"url":splashData.linkUrl};
                    [[HTControllerRouter sharedRouter] route:param];
                }
            }
        }
    }];
    [adView show];
}
@end
