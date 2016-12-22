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

@end
