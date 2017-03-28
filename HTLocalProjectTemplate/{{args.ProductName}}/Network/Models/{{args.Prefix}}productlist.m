//
//  {{args.Prefix}}Productlist.m
//
//  Created by Netease
//
//  Auto build by NEI Builder

#import "{{args.Prefix}}Productlist.h"

/**
 *  
 */
@implementation {{args.Prefix}}Productlist

+ (NSDictionary *)customTypePropertyDic {
    return @{@"productlist" : @"{{args.Prefix}}Product"};
}

+ (NSArray *)baseTypePropertyList {
    return @[@"hasMore"];
}

@end
