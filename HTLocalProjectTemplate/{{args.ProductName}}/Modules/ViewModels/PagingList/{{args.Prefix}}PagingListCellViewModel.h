//
//  {{args.Prefix}}PagingListCellViewModel.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 分页加载列表中 cell 的 viewmodel，在工期较紧的初始项目中使用 viewModel 可以根据独立于服务器的 model 设计来根据交互稿编写 UI，为推荐的一种方式。当然本模板不对架构进行要求，可根据实际需求进行修改。
 */
@interface {{args.Prefix}}PagingListCellViewModel : NSObject

@property (nonatomic, copy) NSString *title;

- (instancetype)initWithIndexNumber:(NSNumber *)index;

@end
