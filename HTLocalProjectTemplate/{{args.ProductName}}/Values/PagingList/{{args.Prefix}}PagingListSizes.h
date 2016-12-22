//
//  {{args.Prefix}}PagingListSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 14/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}PagingListSizes : NSObject

/// pagingListCell 中标题距离 cell 的 contentView 的上边距
+ (CGFloat)pagingListCellTitleTopGap;

/// pagingListCell 中标题距离 cell 的 contentView 的上边距
+ (CGFloat)pagingListCellTitleBottomGap;

@end
