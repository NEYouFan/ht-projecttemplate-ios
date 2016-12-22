//
//  {{args.Prefix}}NavigationTabBarColors.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}NavigationTabBarColors : NSObject

/* **************************** 导航栏颜色相关，可根据所需自由添加 ********************************/

/// 导航栏背景色
+ (UIColor *)naviBackgroundColor;

/// 导航栏字体颜色
+ (UIColor *)naviForegroundColor;


/* ***************************** tabBar 颜色相关，可根据所需自由添加 *****************************/

+ (UIColor *)tabBarBadgeBackgroundColor;

@end
