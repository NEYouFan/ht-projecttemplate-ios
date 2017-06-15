//
//  {{args.Prefix}}ProductlistRequest.m
//
//  Created by Netease
//
//  Auto build by NEI Builder

#import "{{args.Prefix}}ProductlistRequest.h"
#import "HTNetworking.h"
#import "{{args.Prefix}}productlist.h"

@implementation {{args.Prefix}}ProductlistRequest

+ (RKRequestMethod)requestMethod {
    return RKRequestMethodGET;
}

+ (NSString *)requestUrl {
    return @"/productlist";
}

+ (RKMapping *)responseMapping {
    return [{{args.Prefix}}Productlist ht_modelMapping];
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
