//
//  AppDelegate.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "SDWebImageDownloader.h"
#import "{{args.Prefix}}TabbarController.h"
#import "{{args.Prefix}}NetworkConfig.h"
#import "HTNavigationController.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "{{args.Prefix}}SplashScreenController.h"
#import "AppDelegate+Notifications.h"
#import "{{args.Prefix}}LoginController.h"
#import <HTSplashADView/HTSplashADView.h>

@interface AppDelegate () <{{args.Prefix}}SplashScreenDelegate, {{args.Prefix}}LoginDelegate>

@property (nonatomic, strong) {{args.Prefix}}SplashScreenController *splashScreenController;
@property (nonatomic, strong) {{args.Prefix}}LoginController *loginController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化网络配置.
    [{{args.Prefix}}NetworkConfig {{args.Prefix}}NetworkInit];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    // SDWebImage 图片加载方式 LIFO (为了优化显示效果，后入队的先加载)
    [[SDWebImageDownloader sharedDownloader] setExecutionOrder:SDWebImageDownloaderLIFOExecutionOrder];
    
    // 全局键盘设置
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.enable = YES;
    keyboardManager.shouldResignOnTouchOutside = YES;
    keyboardManager.keyboardDistanceFromTextField = 80;
    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES;
    keyboardManager.enableAutoToolbar = NO;
    
    _splashScreenController = [[{{args.Prefix}}SplashScreenController alloc] init];
    _splashScreenController.delegate = self;
    self.window.rootViewController = _splashScreenController;
    [self.window makeKeyAndVisible];
    [_splashScreenController loadSplashView];

    [self registerRemoteNotifications];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - {{args.Prefix}}SplashScreenDelegate.

- (void)splashScreenDidDisappear:({{args.Prefix}}SplashScreenController *)splashScreenController {
    // 延时获取新闪屏的内容并更新对应的闪屏信息，具体的内容请自行填充
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        HTSplashData *data = [[HTSplashData alloc] init];
        data.imageUrl = @"https://a-ssl.duitang.com/uploads/item/201504/25/20150425H0930_cXNKH.png";
        data.linkUrl = @"http://www.163.com";
        data.showCountdown = YES;
        data.countdownTime = 3.0;
        data.expireTime = [[NSDate dateWithTimeIntervalSinceNow:100000] timeIntervalSince1970] * 1000;
        [[HTSplashADManager sharedInstance] updateSplashData:data];
    });

    if (_splashScreenController != splashScreenController) {
        return;
    }
    UIViewController *rootController = [self getRootController];
    self.window.rootViewController = rootController;
    
    // 闪屏页面转场过渡
    [rootController.view addSubview:splashScreenController.view];
    [UIView animateWithDuration:.25
                     animations:^{
                         splashScreenController.view.alpha = 0;
                     } completion:^(BOOL finished) {
                         [splashScreenController.view removeFromSuperview];
                     }];
}

- (UIViewController *)getRootController {
    // 闪屏页消失后，可根据产品具体需求获取应该显示的页面，例如：如果不允许未登录用户查看信息，则可以判断是否有用户登录，若没有，则展示登录页面；当第一次安装应用时的教学页面也可以在这时显示。
    if ([{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin || [{{args.Prefix}}UserDataManager sharedInstance].cancelLogin) {
        
        _tabBarController = [[{{args.Prefix}}TabBarController alloc] init];
        
        HTNavigationController *rootNaviController = [[HTNavigationController alloc] initWithRootViewController:_tabBarController];
        [rootNaviController setNavigationBarHidden:YES animated:NO];
        _rootNavigationController = rootNaviController;
        return rootNaviController;
    } else {
        _loginController = [[{{args.Prefix}}LoginController alloc] init];
        _loginController.delegate = self;
        return [[HTNavigationController alloc] initWithRootViewController:_loginController];
    }
}

#pragma mark - {{args.Prefix}}LoginDelegate.

- (void)loginSuccess:({{args.Prefix}}LoginController *)controller {
    if (_loginController != controller) {
        return;
    }
    
    UIViewController *rootController = [self getRootController];
    self.window.rootViewController = rootController;
    
    // 页面转场过渡
    [rootController.view addSubview:_loginController.view];
    [UIView animateWithDuration:.25
                     animations:^{
                         _loginController.view.alpha = 0;
                     } completion:^(BOOL finished) {
                         [_loginController.view removeFromSuperview];
                     }];
}

- (void)loginFailed:({{args.Prefix}}LoginController *)controller {
    
}

- (void)loginCanceled:({{args.Prefix}}LoginController *)controller {
    if (_loginController != controller) {
        return;
    }
    
    [{{args.Prefix}}UserDataManager sharedInstance].cancelLogin = YES;
    
    UIViewController *rootController = [self getRootController];
    self.window.rootViewController = rootController;
    
    // 页面转场过渡
    [rootController.view addSubview:_loginController.view];
    [UIView animateWithDuration:.25
                     animations:^{
                         _loginController.view.alpha = 0;
                     } completion:^(BOOL finished) {
                         [_loginController.view removeFromSuperview];
                     }];
}

@end
