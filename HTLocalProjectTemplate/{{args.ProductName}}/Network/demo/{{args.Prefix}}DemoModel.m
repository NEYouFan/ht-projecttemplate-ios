//
//  {{args.Prefix}}DemoModel.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}DemoModel.h"

@implementation {{args.Prefix}}DemoModel

+ (NSDictionary *)customTypePropertyDic {
    return @{};
}

+ (NSArray *)baseTypePropertyList {
    return @[@"boolParam", @"intParam", @"stringParam"];
}

@end
