//
//  NSObject+{{args.Prefix}}BaseRequest.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 14/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "NSObject+{{args.Prefix}}BaseRequest.h"
#import "RKMappingResult+{{args.Prefix}}NetworkResultMapping.h"
#import "{{args.Prefix}}NetworkStatusModel.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "{{args.Prefix}}NetworkConfig.h"
//#import "{{args.Prefix}}LoginController.h"

@implementation NSObject ({{args.Prefix}}BaseRequest)

#pragma mark - Public methods.

- (void)baseFlowRequestWithBlock:(HTBaseRequest *(^)(void))buildRequestBlock success:(void (^)(RKObjectRequestOperation *, RKMappingResult *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure {
    if (!buildRequestBlock || !success || !failure) {
        return;
    }
    
    HTBaseRequest *request = buildRequestBlock();
    [request startWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        success(operation, mappingResult);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (operation.mappingResult.statusInfo.code == {{args.Prefix}}NetworkCodeInvalidAccessToken) {
//            [{{args.Prefix}}LoginController showLoginControllerWithSuccessBlock:^{
//                [weakSelf baseFlowRequestWithBlock:buildRequestBlock success:success failure:failure];
//            } cancelBlock:nil];
            [{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin = NO;
        } else {
            failure(operation, nil);
        }
    }];
}

@end
