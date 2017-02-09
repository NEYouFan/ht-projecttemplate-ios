//
//  {{args.Prefix}}DemoRequest.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}DemoRequest.h"
#import "{{args.Prefix}}DemoModel.h"

@implementation {{args.Prefix}}DemoRequest

+ (RKRequestMethod)requestMethod {
    return RKRequestMethodGET;
}

+ (NSString *)requestUrl {
    return @"/demoRequestUrl";
}

+ (RKMapping *)responseMapping {
    return [{{args.Prefix}}DemoModel ht_modelMapping];
}

+ (NSString *)keyPath {
    return @"data";
}

- (NSDictionary *)requestParams {
    NSDictionary *dic = [self ht_modelToJSONObject];
    if ([dic isKindOfClass:[NSDictionary class]] && [dic count] > 0) {
        return dic;
    }
    
    return nil;
}

@end
