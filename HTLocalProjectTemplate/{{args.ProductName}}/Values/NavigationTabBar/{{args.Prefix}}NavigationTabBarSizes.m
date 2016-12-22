//
//  {{args.Prefix}}NavigationTabBarSizes.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}NavigationTabBarSizes.h"

@implementation {{args.Prefix}}NavigationTabBarSizes

/* ********************** 导航栏字体及布局等参数，可根据所需自由添加 ************************/

+ (UIFont *)naviTitleFont {
    return [UIFont systemFontOfSize:14];
}


/* ********************** tabBar 字体及布局等参数，可根据所需自由添加 ************************/

+ (UIFont *)tabBarTitleFont {
    return [UIFont systemFontOfSize:12];
}

+ (CGFloat)tabTitleLabelSideEdge {
    return 5;
}

+ (CGFloat)tabTitleIconGap {
    return 3;
}

+ (CGFloat)tabIconTopMargin {
    return 8;
}

+ (CGSize)dotBadgeSize {
    return CGSizeMake(6, 6);
}

+ (CGFloat)dotBadgeTopMargin {
    return 6;
}

+ (CGFloat)dotBadgeRightMargin {
    return 60;
}

+ (CGSize)badgeSize {
    return CGSizeMake(16, 16);
}

+ (CGFloat)badgeRightMargin {
    return 60;
}

+ (CGFloat)badgeTopMargin {
    return 6;
}

+ (CGFloat)badgeTextFontSize {
    return 8;
}

@end
