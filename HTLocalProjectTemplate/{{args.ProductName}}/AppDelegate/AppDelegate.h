//
//  AppDelegate.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

#define APPDELEGATE() ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@class HTNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,
                                      UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) HTNavigationController *rootNavigationController;


/**
 设置当前选中哪个 tab

 @param index 需要选中的 tab 的序号(从0开始)
 */
- (void)selectTabbarIndex:(NSInteger)index;

/**
 设置某个 tab 显示带字符串的红点

 @param index 需要显示红点的 tab 序号
 @param text 红点显示的文本
 */
- (void)showTabBadgeAtIndex:(NSInteger)index text:(NSString *)text;

/**
 隐藏某个 tab 上的红点

 @param index 需要隐藏红点的 tab 序号
 */
- (void)hideTabBadgeAtIndex:(NSInteger)index;

@end

