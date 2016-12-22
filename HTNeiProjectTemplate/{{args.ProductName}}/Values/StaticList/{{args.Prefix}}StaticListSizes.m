//
//  {{args.Prefix}}StaticListSizes.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 14/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}StaticListSizes.h"

@implementation {{args.Prefix}}StaticListSizes

+ (CGFloat)contentLeftMargin {
    return 90;
}

+ (CGSize)actionButtonSize {
    return CGSizeMake(60, 30);
}

+ (CGFloat)actionButtonRightMargin {
    return 15;
}

+ (UIFont *)titleLabelFont {
    return [UIFont systemFontOfSize:15];
}

+ (UIFont *)contentLabelFont {
    return [UIFont systemFontOfSize:14];
}

@end
