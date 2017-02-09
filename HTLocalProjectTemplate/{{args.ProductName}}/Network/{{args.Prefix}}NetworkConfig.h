//
//  {{args.Prefix}}NetworkConfig.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 一般 App 有三种服务器环境
 
 @{{args.Prefix}}NetworkDevEnv     开发环境
 @{{args.Prefix}}NetworkOnlineEnv  线上环境
 @{{args.Prefix}}NetworkPreEnv     预发布环境
 */
typedef NS_ENUM(NSInteger, {{args.Prefix}}NetworkHostEnv) {
    /// 开发环境
    {{args.Prefix}}NetworkDevEnv,
    /// 预发布环境
    {{args.Prefix}}NetworkPreEnv,
    /// 线上环境
    {{args.Prefix}}NetworkOnlineEnv,
};

/**
 客户端向服务端发送一些请求时，服务器通常会返回一个状态码，表示请求的结果。
 为了避免程序中出现各种数值的状态码，这里使用枚举的方式管理状态码。
 
 @{{args.Prefix}}NetworkCodeSuccess 响应成功的状态码
 @{{args.Prefix}}NetworkCodeInvalidAccessToken 无效 token
 @{{args.Prefix}}NetworkCodeInvalidPassword 密码无效
 
 @note 可根据产品的具体需求修改
 */
typedef NS_ENUM(NSInteger, {{args.Prefix}}NetworkCode) {
    /// 响应成功的状态码
    {{args.Prefix}}NetworkCodeSuccess = 200,
    /// 无效 token
    {{args.Prefix}}NetworkCodeInvalidAccessToken = 201,
    /// 密码无效
    {{args.Prefix}}NetworkCodeInvalidPassword = 260,
};

@interface {{args.Prefix}}NetworkConfig : NSObject

/// 网络库初始化的工作
+ (void){{args.Prefix}}NetworkInit;

/// 获取当前客户端配置的服务器环境
+ ({{args.Prefix}}NetworkHostEnv)hostEnv;

/// 获取服务器地址
+ (NSString *)getBaseUrlString;

/// 开启接口Mock功能, 仅仅在DEBUG模式下有效
+ (BOOL)enableMock;

@end
