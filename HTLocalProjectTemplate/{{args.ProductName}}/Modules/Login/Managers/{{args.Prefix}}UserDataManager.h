//
//  {{args.Prefix}}UserDataManager.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 存放用户信息，如：用户名、昵称、请求的token、设置的偏好、是否已登录等。
 
 @note 这里不应该存储应用的配置信息，如目前运行的环境、https证书、IM的key等，这些信息应该由 {{args.Prefix}}AppConfigurations 来管理。此外，本示例中存储信息使用的是 UserDefaults，如使用者需要高安全性，可自行替换实现即可。
 */
@interface {{args.Prefix}}UserDataManager : NSObject

/// 是否已经登录
@property (nonatomic, assign) BOOL alreadyLogin;
/// 是否取消登录，例如用户希望稍后登录
@property (nonatomic, assign) BOOL cancelLogin;
/// 用户名
@property (nonatomic, copy) NSString *userName;
/// 头像
@property (nonatomic, copy) NSString *headerIcon;
/// 请求用的 token
@property (nonatomic, copy) NSString *token;
/// 用户手机号码
@property (nonatomic, copy) NSString *phoneNumber;
/// 是否保留原始图片
@property (nonatomic, assign) BOOL saveOriginalPicture;
/// 缓存大小
@property (nonatomic, assign) CGFloat cacheSize;

+ (instancetype)sharedInstance;
- (void)clearUserInfo;
- (void)clearCache;

@end
