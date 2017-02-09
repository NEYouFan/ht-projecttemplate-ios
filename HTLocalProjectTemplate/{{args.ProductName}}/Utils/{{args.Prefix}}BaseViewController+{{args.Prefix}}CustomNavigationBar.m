//
//  {{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "ColorUtils.h"
#import "UIViewController+HTRouterUtils.h"

@implementation {{args.Prefix}}BaseViewController ({{args.Prefix}}CustomNavigationBar)

- (void){{args.CategoryPrefix}}_applyDefaultNavigationBarStyle {
    // 设置状态栏样式
    self.statusBarStyle = {{args.Prefix}}StatusBarStyleLightContent;
    // 设置导航栏背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRGBValue:kNaviBackgroundColor]];
    // 设置导航栏是否需要混色
    self.navigationController.navigationBar.translucent = NO;
    // 设置导航栏字体颜色、字体样式
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGBValue:kNaviForegroundColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:kNaviTitleFontSize], NSFontAttributeName, nil]];
}

- (void){{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus {
    // 设置状态栏样式
    self.statusBarStyle = {{args.Prefix}}StatusBarStyleLightContent;
    // 设置导航栏背景色为透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 隐藏设置导航栏最下面的一条线
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    // 不让导航栏自动调整 scrollView 的 contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void){{args.CategoryPrefix}}_applyTransparentNavigationBarDarkStatus {
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus];
    self.statusBarStyle = {{args.Prefix}}StatusBarStyleDefault;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationLeftBackItem {
    UIButton *backButton = [self {{args.CategoryPrefix}}_addNavigationLeftItem];
    [backButton addTarget:self action:@selector(ht_back) forControlEvents:UIControlEventTouchUpInside];
    
    // 导航栏左侧按钮背景图片(根据视觉需求自定义)
    UIImage *backImage = [UIImage imageNamed:@"navi_back"];
    // 导航栏左侧按钮高亮时的背景图片(根据视觉需求自定义)
    UIImage *backHighlightImage = [UIImage imageNamed:@"navi_back_hl"];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    
    return backButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationLeftItem {
    // 新建导航栏左侧按钮
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftButton]];

    return leftButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationRightSettingItem {
    UIButton *settingButton = [self {{args.CategoryPrefix}}_addNavigationRightItem];
    
    // 导航栏右侧按钮背景图片(根据视觉需求自定义)
    UIImage *settingImage = [UIImage imageNamed:@"navi_setting"];
    // 导航栏右侧按钮高亮时的背景图片(根据视觉需求自定义)
    UIImage *settingHighlightImage = [UIImage imageNamed:@"navi_setting_hl"];
    
    [settingButton setBackgroundImage:settingImage forState:UIControlStateNormal];
    [settingButton setBackgroundImage:settingHighlightImage forState:UIControlStateHighlighted];
    [settingButton sizeToFit];
    
    return settingButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationRightCloseItem {
    UIButton *closeButton = [self {{args.CategoryPrefix}}_addNavigationRightItem];
    
    // 导航栏右侧按钮背景图片(根据视觉需求自定义)
    UIImage *closeImage = [UIImage imageNamed:@"navi_close"];
    // 导航栏右侧按钮高亮时的背景图片(根据视觉需求自定义)
    UIImage *closeHighlightImage = [UIImage imageNamed:@"navi_close_hl"];
    
    [closeButton setBackgroundImage:closeImage forState:UIControlStateNormal];
    [closeButton setBackgroundImage:closeHighlightImage forState:UIControlStateHighlighted];
    [closeButton sizeToFit];

    return closeButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationRightItem {
    // 新建导航栏右侧按钮，并设置背景图(可根据需要修改 button 样式)
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:rightButton]];

    return rightButton;
}


@end
