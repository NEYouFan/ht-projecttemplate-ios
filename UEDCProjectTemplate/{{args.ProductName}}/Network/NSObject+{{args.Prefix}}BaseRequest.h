//
//  NSObject+{{args.Prefix}}BaseRequest.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 14/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTBaseRequest.h"

/**
 当请求成功或者失败时，如果所有请求有共同需要处理的逻辑，可以在这个方法中实现，例如：token失败后进行 token 的刷新，或者弹出登录页面。
 
 @note 如果请求没有需要处理的通用逻辑，可删除该方法，使用 HTNetworking 默认提供的方案处理网络请求。
 */
@interface NSObject ({{args.Prefix}}BaseRequest)

/**
 发送网络请求

 @param buildRequestBlock 创建 HTNetworking request 
 @param success 请求成功时执行的 block
 @param failure 请求失败时执行的 block
 */
- (void)baseFlowRequestWithBlock:(HTBaseRequest * (^)(void))buildRequestBlock success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
