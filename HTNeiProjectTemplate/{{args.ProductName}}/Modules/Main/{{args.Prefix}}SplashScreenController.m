//
//  {{args.Prefix}}SplashScreenController.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}SplashScreenController.h"

@interface {{args.Prefix}}SplashScreenController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation {{args.Prefix}}SplashScreenController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [{{args.Prefix}}ThemeColors themeBackgroundColor];
    
    // 可根据产品需求，加载广告等。这里只是简单的显示一下启动页面
    [self loadSubviews];
    [self scheduleDismiss];
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
    CGFloat screenHeight = [{{args.Prefix}}ThemeSizes screenHeight];
    
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


#pragma mark - Actions.

- (void)scheduleDismiss {
    @{{args.Prefix}}Weak(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_delegate splashScreenDidDisappear:weakSelf];
    });
}

@end
