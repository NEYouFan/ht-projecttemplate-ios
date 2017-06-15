//
//  {{args.Prefix}}AppConfigurations.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}AppConfigurations.h"

static NSString *const kHostEnvironment = @"HostEnvironment";
static NSString *const kAPNsCertificate = @"httemplate-push";

@interface {{args.Prefix}}AppConfigurations ()

@end

@implementation {{args.Prefix}}AppConfigurations

#pragma mark - Initials.

+ (instancetype)sharedAppConfigurations {
    static {{args.Prefix}}AppConfigurations *configurations;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configurations = [[{{args.Prefix}}AppConfigurations alloc] init];
    });
    return configurations;
}

- (instancetype)init {
    if (self = [super init]) {
        // 通过 plist 获取用户配置的 environment
        NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
        _environment = [infoDict objectForKey:kHostEnvironment];
        
        _apnsCertificate = kAPNsCertificate;
    }
    
    return self;
}


@end
