//
//  {{args.Prefix}}DemoModel.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <HTNetworking/HTNetworking.h>

@interface {{args.Prefix}}DemoModel : HTHTTPModel

/**
 *
 */
@property (nonatomic, assign) BOOL boolParam;
/**
 *
 */
@property (nonatomic, assign) NSInteger intParam;
/**
 *
 */
@property (nonatomic, copy) NSString *stringParam;
/**
 *
 */


@end
