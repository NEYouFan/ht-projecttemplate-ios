//
//  AppDelegate+Notifications.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "AppDelegate+Notifications.h"

@implementation AppDelegate (Notifications)

- (void)registerRemoteNotifications {
    if (IOS10) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error) {
                NSLog(@"succeeded!");
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
        }];
    } else if (IOS8_10){ //iOS8-iOS10
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(RemoteNotificationTypeBadge | RemoteNotificationTypeAlert | RemoteNotificationTypeSound) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else { //iOS8以下
        // 由于 deloyment target 在 Xcode8 中不支持 7.0，此处为防止警告暂时注释掉，如需支持 iOS7 可使用注释内的方法为 iOS7 注册通知
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: RemoteNotificationTypeBadge | RemoteNotificationTypeAlert | RemoteNotificationTypeSound];
    }
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(nonnull UIUserNotificationSettings *)notificationSettings {
    // Register for remote notifications.
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 获取到 APNs 返回的 token，可以将 token 传给推送 sdk 或 IM sdk。
}

// 注册deviceToken失败，此处失败，一般是您的环境配置或者证书配置有误
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"register remote notification error -- %@", error);
}

// iOS7-9 收到本地通知的回调
- (void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

// iOS7-9 收到远程通知的回调
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

// iOS10 收到本地和远程通知的回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

@end
