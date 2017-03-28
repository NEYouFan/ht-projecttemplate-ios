//
//  {{args.Prefix}}TabBarController.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 应用的 tabBar，自定义了 tabBar 内的视图，方便使用者自定义动画等。使用者也可以直接使用系统的 UITabbarController
 */
@interface {{args.Prefix}}TabBarController : UITabBarController

/**
 显示指定序号的 tab 视图的角标
 
 @param badgeType 需要显示的角标的类型
 @param text 角标内的文字
 @param index tab 视图的序号
 */
- (void)showBadge:({{args.Prefix}}BadgeType)badgeType text:(NSString*)text atIndex:(NSUInteger)index;

/**
 隐藏指定序号的 tab 视图的角标

 @param index tab 视图的序号
 */
- (void)hideBadge:(NSUInteger)index;

/**
 设置当前选中哪个 tab
 
 @param index 需要选中的 tab 的序号(从0开始)
 */
+ (void)selectTabbarIndex:(NSInteger)index;

/**
 设置某个 tab 显示带字符串的红点
 
 @param index 需要显示红点的 tab 序号
 @param text 红点显示的文本
 */
+ (void)showTabBadgeAtIndex:(NSInteger)index text:(NSString *)text;

/**
 隐藏某个 tab 上的红点
 
 @param index 需要隐藏红点的 tab 序号
 */
+ (void)hideTabBadgeAtIndex:(NSInteger)index;

@end
