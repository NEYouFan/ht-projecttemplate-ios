//
//  {{args.Prefix}}UserDataManager.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}UserDataManager.h"

static NSString *const kAlreadyLoginKey = @"alreadyLogin";
static NSString *const kUserName = @"userName";
static NSString *const kHeaderIcon = @"headerIcon";
static NSString *const kToken = @"token";
static NSString *const kPhoneNumber = @"phoneNumber";

@implementation {{args.Prefix}}UserDataManager

#pragma mark - Life cycle.

+ (instancetype)sharedInstance {
    static {{args.Prefix}}UserDataManager *userDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userDataManager = [[{{args.Prefix}}UserDataManager alloc] init];
    });
    return userDataManager;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)clearUserInfo {
    [self setAlreadyLogin:NO];
    [self setHeaderIcon:nil];
    [self setUserName:nil];
    [self setToken:nil];
    [self setPhoneNumber:nil];
}


#pragma mark - Getter & Setter.

- (BOOL)alreadyLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kAlreadyLoginKey];
}

- (void)setAlreadyLogin:(BOOL)alreadyLogin {
    [[NSUserDefaults standardUserDefaults] setBool:alreadyLogin forKey:kAlreadyLoginKey];
}

- (NSString *)headerIcon {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kHeaderIcon];
}

- (void)setHeaderIcon:(NSString *)headerIcon {
    [[NSUserDefaults standardUserDefaults] setObject:headerIcon forKey:kHeaderIcon];
}

- (NSString *)userName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kUserName];
}

- (void)setUserName:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:kUserName];
}

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:kToken];
}

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kToken];
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:kPhoneNumber];
}

- (NSString *)phoneNumber {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kPhoneNumber];
}

@end
