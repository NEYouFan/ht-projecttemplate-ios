//
//  {{args.Prefix}}ProductlistRequest.h
//
//  Created by Netease
//
//  Auto build by NEI Builder

#import "HTBaseRequest.h"

/**
 *  name: 商品列表接口
 *  description: 获取商品列表
 */
@interface {{args.Prefix}}ProductlistRequest : HTBaseRequest


/**
 *  从第几页开始获取
 */
@property (nonatomic, assign) NSInteger page;
/**
 *  获取数量
 */
@property (nonatomic, assign) NSInteger pageSize;

@end
