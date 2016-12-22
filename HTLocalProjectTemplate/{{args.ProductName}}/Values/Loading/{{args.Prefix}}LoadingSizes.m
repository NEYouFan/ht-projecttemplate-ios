//
//  {{args.Prefix}}LoadingSizes.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 07/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadingSizes.h"

@implementation {{args.Prefix}}LoadingSizes

/* ********************* 与下拉刷新，加载更多相关的字体和布局参数 *************************/

+ (CGFloat)refreshViewHeight {
    return 60;
}

+ (CGFloat)loadmoreViewHeight {
    return 60;
}


/* ************** 与加载出错、网络错误、数据为空，正在加载相关的字体和布局参数 ***************/

+ (CGSize)loadingReloadButtonSize {
    return CGSizeMake(80, 25);
}

+ (CGFloat)loadingIndicationReloadGap {
    return 15;
}

+ (CGFloat)loadingIconIndicationGap {
    return 20;
}

@end
