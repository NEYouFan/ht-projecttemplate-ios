//
//  RKMappingResult+{{args.Prefix}}NetworkResultMapping.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <HTNetworking/HTNetworking.h>

@class {{args.Prefix}}NetworkStatusModel;

/**
 提供获取网络响应中状态信息以及数据信息的便利化方法
 */
@interface RKMappingResult ({{args.Prefix}}NetworkResultMapping)

/// 获取响应状态的信息
- ({{args.Prefix}}NetworkStatusModel *)statusInfo;

/// 获取响应中实际的数据信息(默认是 "data" 字段中的内容，如果返回的 json 字段中信息存在非 "data" 的key中，需要修改该方法实现以获取数据信息
- (id)dataInfo;

@end
