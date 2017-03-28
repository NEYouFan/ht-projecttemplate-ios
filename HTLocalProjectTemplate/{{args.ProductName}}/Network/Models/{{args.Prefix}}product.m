//
//  {{args.Prefix}}Product.m
//
//  Created by Netease
//
//  Auto build by NEI Builder

#import "{{args.Prefix}}Product.h"

/**
 *  商品详情
 */
@implementation {{args.Prefix}}Product

+ (NSDictionary *)customTypePropertyDic {
    return @{};
}

+ (NSArray *)baseTypePropertyList {
    return @[@"productId", @"name", @"price", @"pic"];
}

@end
