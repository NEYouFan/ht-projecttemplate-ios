//
//  {{args.Prefix}}NavigationTabBarSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}NavigationTabBarSizes : NSObject

/* ********************** 导航栏字体及布局等参数，可根据所需自由添加 ************************/

/// 导航栏字体样式
+ (UIFont *)naviTitleFont;


/* ********************** tabBar 字体及布局等参数，可根据所需自由添加 ************************/

/// tabBar 字体样式
+ (UIFont *)tabBarTitleFont;

/// tab 文字 label 的边距
+ (CGFloat)tabTitleLabelSideEdge;

/// tab 文字 label 顶部与 icon 底部的距离
+ (CGFloat)tabTitleIconGap;

/// tab 图标顶部与 tab 视图顶部的距离
+ (CGFloat)tabIconTopMargin;

/// tab 视图的圆红点角标大小
+ (CGSize)dotBadgeSize;

/// tab 视图的圆红点角标顶部与 tab 视图顶部的距离
+ (CGFloat)dotBadgeTopMargin;

/// tab 视图的圆点角标右侧与 tab 视图右侧的距离
+ (CGFloat)dotBadgeRightMargin;

/// tab 视图的文字角标大小
+ (CGSize)badgeSize;

/// tab 视图的文字角标右侧与 tab 视图右侧的距离
+ (CGFloat)badgeRightMargin;

/// tab 视图的文字角标顶部与 tab 视图顶部的距离
+ (CGFloat)badgeTopMargin;
    
/// tab 文字角标的字体大小 
+ (CGFloat)badgeTextFontSize;

@end
