//
//  {{args.Prefix}}NetworkStatusModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 服务器返回的结果中，通常会有相关字段来表示响应的状态，{{args.Prefix}}NetworkStatusModel 就用于表示该信息。
 
 @note 在我们孵化的项目中，接口一般会有状态码(code)和状态码的描述(message)两个字段来表示响应的状态。这里的字段可以根据产品开发中接口的设计进行修改。
 */
@interface {{args.Prefix}}NetworkStatusModel : NSObject

/// 服务器返回的状态码
@property (nonatomic, assign) NSInteger code;
/// 服务器返回的描述消息(非业务信息，一般服务器返回错误时会有错误的描述)。
@property (nonatomic, copy) NSString *message;

@end
