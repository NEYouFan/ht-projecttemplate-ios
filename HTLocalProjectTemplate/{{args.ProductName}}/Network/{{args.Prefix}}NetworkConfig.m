//
//  {{args.Prefix}}NetworkConfig.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}NetworkConfig.h"
#import <HTNetworking/HTNetworking.h>
#import "{{args.Prefix}}NetworkStatusModel.h"
#import "{{args.Prefix}}AppConfigurations.h"
#import "RKMappingResult+{{args.Prefix}}NetworkResultMapping.h"

//该开关决定了是否要开启网络请求接口数据的mock功能
#define kEnableMock 1

static NSString *const k{{args.Prefix}}DevBaseURL = @"https://{{args.ProductName}}.dev.com";
static NSString *const k{{args.Prefix}}OnlineBaseURL = @"https://{{args.ProductName}}.online.com";
static NSString *const k{{args.Prefix}}PreBaseURL = @"https://{{args.ProductName}}.pre.com";
static NSString *const kUserHostEnvironmentOnline = @"online";
static NSString *const kUserHostEnvironmentDev = @"dev";
static NSString *const kUserHostEnvironmentPre = @"pre";



@implementation {{args.Prefix}}NetworkConfig

#pragma mark - Public methods.
+ (BOOL)enableMock{
    return kEnableMock;
}

+ ({{args.Prefix}}NetworkHostEnv)hostEnv {
    NSString *env = [{{args.Prefix}}AppConfigurations sharedAppConfigurations].environment;
    
    if ([env isEqualToString:kUserHostEnvironmentOnline]) {
        return {{args.Prefix}}NetworkOnlineEnv;
    } else if ([env isEqualToString:kUserHostEnvironmentDev]) {
        return {{args.Prefix}}NetworkDevEnv;
    } else if ([env isEqualToString:kUserHostEnvironmentDev]) {
        return {{args.Prefix}}NetworkPreEnv;
    }
    
    return {{args.Prefix}}NetworkOnlineEnv;
}

+ (void){{args.Prefix}}NetworkInit {
    // HTNetworking manager 初始化
    NSURL *baseURL = [NSURL URLWithString:[self getBaseUrlString]];
    RKObjectManager *manager = HTNetworkingInit(baseURL);
    
    // 添加网络请求的响应结果的描述
    [manager addResponseDescriptor:[self statusModelDescriptor]];
    
    // 根据服务器支持的 Http MIME 类型进行设置。
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    
    // 当网络返回正常时，HTNetworking 会执行请求成功的 block，但是结果中状态码不正常时，我们希望可以执行请求失败的 block，那么我们可以在 validResultBlock 中返回 NO 
    manager.validResultBlock = ^(RKObjectRequestOperation *operation) {
        RKMappingResult *result = operation.mappingResult;
        {{args.Prefix}}NetworkStatusModel *status = [result statusInfo];
        if (status.code != {{args.Prefix}}NetworkCodeSuccess) {
            return NO;
        } else {
            return YES;
        }
    };
#ifdef DEBUG
    if ([{{args.Prefix}}NetworkConfig enableMock]) {
        [HTBaseRequest enableMockTest];
    }
#endif
}

+ (NSString *)getBaseUrlString {
    switch ([self hostEnv]) {
        case {{args.Prefix}}NetworkDevEnv:
            return k{{args.Prefix}}DevBaseURL;
            break;
        case {{args.Prefix}}NetworkOnlineEnv:
            return k{{args.Prefix}}OnlineBaseURL;
            break;
        case {{args.Prefix}}NetworkPreEnv:
            return k{{args.Prefix}}PreBaseURL;
            break;
    }
}


#pragma mark - Private methods.

/**
 网络响应收到后，HTNetworking 会将响应结果中的数据解析为相应的 model。
 目前 HTNetworking 默认只对数据字段("data"字段)做了解析，如需要将其他字段解析为 model，则需要自己添加 descriptor。
 例如本方法中，将响应中的 "code" 和 "message" 字段解析为 {{args.Prefix}}NetworkStatusModel。

 @return statusModel descriptor.
 */
+ (RKResponseDescriptor *)statusModelDescriptor {
    RKObjectMapping *statusMapping = [RKObjectMapping mappingForClass:[{{args.Prefix}}NetworkStatusModel class]];
    [statusMapping addAttributeMappingsFromArray:@[@"code", @"message"]];
    RKResponseDescriptor *statusDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:statusMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:nil];
    
    return statusDescriptor;
}

@end
