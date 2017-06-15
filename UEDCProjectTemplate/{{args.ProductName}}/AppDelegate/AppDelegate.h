//
//  AppDelegate.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

#define APPDELEGATE() ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@class HTNavigationController;
@class {{args.Prefix}}TabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,
                                      UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) HTNavigationController *rootNavigationController;
@property (nonatomic, strong) {{args.Prefix}}TabBarController *tabBarController;

@end

