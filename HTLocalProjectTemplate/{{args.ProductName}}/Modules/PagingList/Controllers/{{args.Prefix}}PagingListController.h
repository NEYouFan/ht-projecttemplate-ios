//
//  {{args.Prefix}}PagingListController.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}BaseViewController.h"

/**
 分页加载示例页面，示例程序中基本上给出了分页加载页面加载数据的所有逻辑的处理方式：进入页面首次加载、下拉刷新数据、滑动 tableView 到底部后的加载更多。并提供了根据数据多少处理下拉刷新、加载更多的样式展示的逻辑代码。
 
 模板的使用者可 copy PagingListController 中的代码，并对网络请求部分做适当修改，即可完成自己的 controller 页面。
 */
@interface {{args.Prefix}}PagingListController : {{args.Prefix}}BaseViewController

@end
