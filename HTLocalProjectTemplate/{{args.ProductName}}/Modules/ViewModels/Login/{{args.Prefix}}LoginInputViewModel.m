//
//  {{args.Prefix}}LoginInputViewModel.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoginInputViewModel.h"

@implementation {{args.Prefix}}LoginInputViewModel

- (instancetype)initWithImageName:(NSString *)imageName placeholder:(NSString *)placeholder {
    if (self = [super init]) {
        _iconImage = [UIImage imageNamed:imageName];
        _placeholder = placeholder;
    }
    
    return self;
}

@end
