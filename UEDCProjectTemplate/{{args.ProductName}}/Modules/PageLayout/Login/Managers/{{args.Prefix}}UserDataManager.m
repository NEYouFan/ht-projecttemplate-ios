//
//  {{args.Prefix}}UserDataManager.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}UserDataManager.h"

static NSString *const kAlreadyLoginKey = @"alreadyLogin";
static NSString *const kCancelLoginKey = @"cancelLogin";
static NSString *const kUserNameKey = @"userName";
static NSString *const kHeaderIconKey = @"headerIcon";
static NSString *const kTokenKey = @"token";
static NSString *const kPhoneNumberKey = @"phoneNumber";
static NSString *const kSaveOriginalPicture = @"saveOrigianlPicture";

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
        //TODO: 根据实际缓存读取，这里返回一个模拟值。
        _cacheSize = 20000;
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

- (BOOL)cancelLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kCancelLoginKey];
}

- (void)setCancelLogin:(BOOL)cancelLogin {
    [[NSUserDefaults standardUserDefaults] setBool:cancelLogin forKey:kCancelLoginKey];
}

- (NSString *)headerIcon {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kHeaderIconKey];
}

- (void)setHeaderIcon:(NSString *)headerIcon {
    [[NSUserDefaults standardUserDefaults] setObject:headerIcon forKey:kHeaderIconKey];
}

- (NSString *)userName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kUserNameKey];
}

- (void)setUserName:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:kUserNameKey];
}

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:kTokenKey];
}

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kTokenKey];
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:kPhoneNumberKey];
}

- (NSString *)phoneNumber {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kPhoneNumberKey];
}

- (BOOL)saveOriginalPicture {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSaveOriginalPicture];
}

- (void)setSaveOriginalPicture:(BOOL)saveOriginalPicture {
    [[NSUserDefaults standardUserDefaults] setBool:saveOriginalPicture forKey:kSaveOriginalPicture];
}

- (CGFloat)cacheSize {
    return _cacheSize;
}

- (void)clearCache {
    _cacheSize = 0;
}

@end
