//
//  {{args.Prefix}}ThemeColors.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}ThemeColors.h"
#import "ColorUtils.h"

@implementation {{args.Prefix}}ThemeColors

/* ********************* 主题背景色(通常由视觉统一规范规定)相关 *************************/

+ (UIColor *)themeLineColor {
    return [UIColor lightGrayColor];
}

+ (UIColor *)themeColor {
    return [UIColor colorWithRGBValue:0x32A2EC];
}

+ (UIColor *)themeButtonColor {
    return [self themeColor];
}

+ (UIColor *)themeHighlightButtonColor {
    return [UIColor yellowColor];
}

+ (UIColor *)themeBackgroundColor {
    return [UIColor whiteColor];
}


/* ********************* 主题字体颜色(通常由视觉统一规范规定)相关 *************************/

+ (UIColor *)defaultTextColor {
    return [UIColor blackColor];
}

+ (UIColor *)placeholderTextColor {
    return [UIColor lightGrayColor];
}

@end
