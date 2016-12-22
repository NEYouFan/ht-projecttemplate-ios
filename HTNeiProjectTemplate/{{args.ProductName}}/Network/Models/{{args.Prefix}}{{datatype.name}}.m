//
//  {{args.Prefix}}{{datatype.name}}.m
//
//  Created by {{args.Author}}
//
//  Auto build by NEI Builder

#import "{{args.Prefix}}{{datatype.name}}.h"

/**
 *  {{datatype.description}}
 */
@implementation {{args.Prefix}}{{datatype.name}}

+ (NSDictionary *)customTypePropertyDic {
    return {{dictStrHelper datatype}};
}

+ (NSArray *)baseTypePropertyList {
    return {{baseStrHelper datatype}};
}

@end
