//
//  RKMappingResult+{{args.Prefix}}NetworkResultMapping.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "RKMappingResult+{{args.Prefix}}NetworkResultMapping.h"
#import "{{args.Prefix}}NetworkStatusModel.h"

@implementation RKMappingResult ({{args.Prefix}}NetworkResultMapping)

- ({{args.Prefix}}NetworkStatusModel *)statusInfo {
    __block {{args.Prefix}}NetworkStatusModel *error = nil;
    [self.array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[{{args.Prefix}}NetworkStatusModel class]]) {
            error = obj;
        }
    }];
    return error;
}

- (id)dataInfo {
    id data = [self.dictionary objectForKey:@"data"];
    return data;
}

@end
