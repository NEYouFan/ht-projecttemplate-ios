//
//  {{args.Prefix}}NotificationCenter.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}NotificationCenter.h"

static NSString *const kNotification1 = @"notification1";

@implementation {{args.Prefix}}NotificationCenter

+ (void)postNotification1WithObject:(id)anObject {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification1 object:anObject];
}

@end
