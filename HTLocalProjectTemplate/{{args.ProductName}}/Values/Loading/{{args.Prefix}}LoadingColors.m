//
//  {{args.Prefix}}LoadingColors.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 07/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadingColors.h"

@implementation {{args.Prefix}}LoadingColors

/* ********************* 下拉刷新，加载更多相关的颜色 *************************/

+ (UIColor *)refreshBackgroundColor {
    return [UIColor lightGrayColor];
}


/* ************** 加载出错、网络错误、数据为空，正在加载相关的颜色 ***************/

+ (UIColor *)loadingBackgroundColor {
    return [UIColor whiteColor];
}

@end
