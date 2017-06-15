//
//  {{args.Prefix}}PagingListCell.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}PagingListCellModel;

/**
 分页加载示例页面中的 cell
 */
@interface {{args.Prefix}}PagingListCell : UITableViewCell

@property (nonatomic, strong) {{args.Prefix}}PagingListCellModel *model;

@end
