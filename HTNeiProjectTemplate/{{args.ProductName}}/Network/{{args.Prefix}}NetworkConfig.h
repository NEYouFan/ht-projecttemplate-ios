//
//  {{args.Prefix}}NetworkConfig.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}NetworkConfig : NSObject

/// 网络库初始化的工作
+ (void){{args.Prefix}}NetworkInit;

/// 获取当前客户端配置的服务器环境
+ ({{args.Prefix}}NetworkHostEnv)hostEnv;

/// 获取服务器地址
+ (NSString *)getBaseUrlString;

@end
