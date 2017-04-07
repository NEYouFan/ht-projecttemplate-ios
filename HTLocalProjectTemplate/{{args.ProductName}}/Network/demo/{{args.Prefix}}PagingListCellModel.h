//
//  {{args.Prefix}}PagingListCellModel.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 分页加载列表中 cell 的 Model
 */
@interface {{args.Prefix}}PagingListCellModel : NSObject

@property (nonatomic, copy) NSString *title;

- (instancetype)initWithIndexNumber:(NSNumber *)index;

@end
