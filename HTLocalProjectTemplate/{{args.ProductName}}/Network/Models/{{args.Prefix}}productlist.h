//
//  {{args.Prefix}}Productlist.h
//
//  Created by Netease
//
//  Auto build by NEI Builder


#import "HTHTTPModel.h"

@class {{args.Prefix}}Product;

/**
 *  
 */
@interface {{args.Prefix}}Productlist : HTHTTPModel

@property (nonatomic, assign) BOOL hasMore;

/**
 *  
 */
@property (nonatomic, strong) NSArray<{{args.Prefix}}Product *> *productlist;

@end
