//
//  {{args.Prefix}}AppConfigurations.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 存放工程的一些配置，如是环境还是线上环境，客户端 https 证书，即时通信使用的 key/id 等信息。注意 @implementation 中只给出了简单的实现，可修改实现方案(如从 plist 中读取)。
 
 注意这个类中不应该存放与用户有关的信息，如：用户名、昵称、请求的token、设置的偏好、是否已登录等不应在这里存储，而应该在 {{args.Prefix}}UserDataManager 中进行管理。
 
 @note 此类中的配置信息基本都是只读的，如果需要写入，则请谨慎思考是否应放入此类中。
 */
@interface {{args.Prefix}}AppConfigurations : NSObject

/// App 目前运行于什么环境
@property (nonatomic, copy, readonly) NSString *environment;
/// APNs 推送使用的证书名字，IM 通信中大多需要此信息
@property (nonatomic, copy, readonly) NSString *apnsCertificate;

/// 单例方法，获取 AppConfiguration.
+ (instancetype)sharedAppConfigurations;

@end
