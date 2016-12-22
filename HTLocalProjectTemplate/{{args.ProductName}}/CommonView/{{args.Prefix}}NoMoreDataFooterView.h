//
//  {{args.Prefix}}NoMoreDataFooterView.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 分页加载没有更多数据时列表底部展示的 View。
 
 当列表页中数据较多时，通常采取分页加载的方式，即每次浏览到列表页底部时会进行加载更多。
 当没有更多数据时，列表页底部通常也会给一个提示告诉用户：当前页面所有数据已加载完成。
 
 @note 可根据视觉需求自定义展示效果
 */
@interface {{args.Prefix}}NoMoreDataFooterView : UIView

@end
