//
//  {{args.Prefix}}Product.h
//
//  Created by Netease
//
//  Auto build by NEI Builder


#import "HTHTTPModel.h"


/**
 *  商品详情
 */
@interface {{args.Prefix}}Product : HTHTTPModel
/**
 *  
 */
@property (nonatomic, assign) NSInteger productId;
/**
 *  
 */
@property (nonatomic, copy) NSString *name;
/**
 *  
 */
@property (nonatomic, assign) NSInteger price;
/**
 *  
 */
@property (nonatomic, copy) NSString *pic;

@end
