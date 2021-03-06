//
//  AppDelegate.m
//  {{args.Prefix}}
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
#import "{{args.Prefix}}SplashScreenController.h"
#import "AppDelegate+Notifications.h"
#import <HTSplashADView/HTSplashADView.h>
#import <NELoginSDK/NELoginSDK.h>

@interface AppDelegate () <{{args.Prefix}}SplashScreenDelegate>

@property (nonatomic, strong) {{args.Prefix}}SplashScreenController *splashScreenController;

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
    
    NSString *publicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDXvkc6XaYN6s4zTb0goCj8T8NRX9ULYq1yGnpgs7GiTQzzwACZ/C/8HGtgRLw5/GiFqZVGVdvRU0egzB0jAZHoraZPmcNPLse5/yTOC+7YZcfR5uUvSZGncm0vHV4VXxMpHhew7p7JInZpno+NgLfJ3k+lU5qhz6UByAIuzaKIawIDAQAB";
    
    [LoginEngine initWithProductId:@"{{args.CategoryPrefix}}_client" ursPublicKey:publicKey productPrivateKeyP12Psd:@"123456" completionBlock:^(BOOL isSuccess, NSError *aError) {
        
    }];
    
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
//    // 延时获取新闪屏的内容并更新对应的闪屏信息，具体的内容请自行填充
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        HTSplashData *data = [[HTSplashData alloc] init];
//        data.imageUrl = @"http://images.liqucn.com/h027/h93/images201510271606423_info288X512.jpg";
//        data.linkUrl = @"http://www.163.com";
//        data.showCountdown = YES;
//        data.countdownTime = 3.0;
//        data.expireTime = [[NSDate dateWithTimeIntervalSinceNow:100000] timeIntervalSince1970] * 1000;
//        [[HTSplashADManager sharedInstance] updateSplashData:data];
//    });

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
        _tabBarController = [[{{args.Prefix}}TabBarController alloc] init];
        HTNavigationController *rootNaviController = [[HTNavigationController alloc] initWithRootViewController:_tabBarController];
        [rootNaviController setNavigationBarHidden:YES animated:NO];
        _rootNavigationController = rootNaviController;
        return rootNaviController;
}

//#pragma mark - {{args.Prefix}}LoginDelegate.
//
//- (void)loginSuccess:({{args.Prefix}}LoginController *)controller {
//    if (_loginController != controller) {
//        return;
//    }
//    
//    UIViewController *rootController = [self getRootController];
//    self.window.rootViewController = rootController;
//    
//    // 页面转场过渡
//    [rootController.view addSubview:_loginController.view];
//    [UIView animateWithDuration:.25
//                     animations:^{
//                         _loginController.view.alpha = 0;
//                     } completion:^(BOOL finished) {
//                         [_loginController.view removeFromSuperview];
//                     }];
//}
//
//- (void)loginFailed:({{args.Prefix}}LoginController *)controller {
//    
//}
//
//- (void)loginCanceled:({{args.Prefix}}LoginController *)controller {
//    if (_loginController != controller) {
//        return;
//    }
//    
//    [{{args.Prefix}}UserDataManager sharedInstance].cancelLogin = YES;
//    
//    UIViewController *rootController = [self getRootController];
//    self.window.rootViewController = rootController;
//    
//    // 页面转场过渡
//    [rootController.view addSubview:_loginController.view];
//    [UIView animateWithDuration:.25
//                     animations:^{
//                         _loginController.view.alpha = 0;
//                     } completion:^(BOOL finished) {
//                         [_loginController.view removeFromSuperview];
//                     }];
//}

@end
