//
//  {{args.Prefix}}NavigationTabBarColors.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}NavigationTabBarColors.h"

@implementation {{args.Prefix}}NavigationTabBarColors

/* **************************** 导航栏颜色相关，可根据所需自由添加 ********************************/

+ (UIColor *)naviBackgroundColor {
    return [{{args.Prefix}}ThemeColors themeColor];
}

+ (UIColor *)naviForegroundColor {
    return [UIColor whiteColor];
}


/* ***************************** tabBar 颜色相关，可根据所需自由添加 *****************************/

+ (UIColor *)tabBarBadgeBackgroundColor {
    return [UIColor redColor];
}

@end
