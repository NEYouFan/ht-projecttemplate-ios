//
//  {{args.Prefix}}PagingListCellViewModel.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}PagingListCellViewModel.h"

@implementation {{args.Prefix}}PagingListCellViewModel

- (instancetype)initWithIndexNumber:(NSNumber *)index {
    if (self = [super init]) {
        _title = [NSString stringWithFormat:@"HTTemplate PagingList Cell, index = %ld", [index integerValue]];
    }
    
    return self;
}

- (instancetype)init {
    if (self = [self initWithIndexNumber:@(0)]) {
        
    }
    
    return self;
}

@end
